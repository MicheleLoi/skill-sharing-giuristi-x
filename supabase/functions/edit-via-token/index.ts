// Edge Function: edit-via-token
//
// Permette all'autore di modificare o cancellare un proprio contributo (review
// o error) usando il token UUID ricevuto via email a tempo di submit.
//
// Endpoint: POST https://<project>.supabase.co/functions/v1/edit-via-token
//
// Body JSON:
//   - GET-style "load": { "token": "<uuid>", "action": "load" }
//       → ritorna { target_type, target_id, payload: {...} }
//   - "update":        { "token": "<uuid>", "action": "update", "payload": {...} }
//       → applica UPDATE sui campi consentiti, ritorna { ok: true }
//   - "delete":        { "token": "<uuid>", "action": "delete" }
//       → applica DELETE sulla riga, ritorna { ok: true }
//
// Validazione token:
//   - esistente in edit_tokens
//   - non revoked
//   - non scaduto (expires_at > now)
//   - target_type/target_id risolto sulla tabella corretta
//
// Deploy: dashboard → Edge Functions → Create function → name "edit-via-token"
//         → paste questo file → Deploy.

// deno-lint-ignore-file
// @ts-nocheck

import { createClient } from "https://esm.sh/@supabase/supabase-js@2.45.0";

const CORS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...CORS, "Content-Type": "application/json" },
  });
}

interface ReqBody {
  token: string;
  action: "load" | "update" | "delete";
  payload?: Record<string, unknown>;
}

// Campi editabili per ciascun target type
const EDITABLE_FIELDS: Record<"review" | "error", string[]> = {
  review: ["stars", "text", "author_name", "anonymous"],
  error: [
    "title",
    "ai_tool",
    "area",
    "author_name",
    "anonymous",
    "description",
    "prompt",
    "wrong_answer",
    "correction",
    "references_text",
  ],
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 204, headers: CORS });
  }
  if (req.method !== "POST") {
    return jsonResponse({ error: "method not allowed" }, 405);
  }

  let body: ReqBody;
  try {
    body = await req.json();
  } catch {
    return jsonResponse({ error: "invalid JSON" }, 400);
  }

  if (!body || !body.token || !body.action) {
    return jsonResponse({ error: "missing token or action" }, 400);
  }
  if (!["load", "update", "delete"].includes(body.action)) {
    return jsonResponse({ error: "action must be load|update|delete" }, 400);
  }

  const supabaseUrl = Deno.env.get("SUPABASE_URL");
  const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");
  if (!supabaseUrl || !serviceRoleKey) {
    console.error("Supabase env missing");
    return jsonResponse({ error: "server misconfigured" }, 500);
  }
  const supabase = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  // 1. Risolvi e valida token
  const { data: tokenRow, error: tokenErr } = await supabase
    .from("edit_tokens")
    .select("token, target_type, target_id, expires_at, revoked")
    .eq("token", body.token)
    .single();

  if (tokenErr || !tokenRow) {
    return jsonResponse({ error: "token not found" }, 404);
  }
  if ((tokenRow as any).revoked) {
    return jsonResponse({ error: "token revoked" }, 403);
  }
  const expiresAt = new Date((tokenRow as any).expires_at);
  if (expiresAt < new Date()) {
    return jsonResponse({ error: "token expired" }, 403);
  }

  const targetType = (tokenRow as any).target_type as "review" | "error";
  const targetId = (tokenRow as any).target_id as string;
  const targetTable = targetType === "review" ? "reviews" : "errors";

  // 2. Esegui azione
  if (body.action === "load") {
    const { data, error } = await supabase
      .from(targetTable)
      .select("*")
      .eq("id", targetId)
      .single();
    if (error || !data) {
      return jsonResponse({ error: "target not found" }, 404);
    }
    return jsonResponse({ ok: true, target_type: targetType, target_id: targetId, payload: data });
  }

  if (body.action === "update") {
    if (!body.payload) {
      return jsonResponse({ error: "missing payload for update" }, 400);
    }
    // Sanitize: solo campi editabili
    const allowed = EDITABLE_FIELDS[targetType];
    const cleanPayload: Record<string, unknown> = {};
    for (const k of allowed) {
      if (k in body.payload) cleanPayload[k] = body.payload[k];
    }
    if (Object.keys(cleanPayload).length === 0) {
      return jsonResponse({ error: "no editable fields in payload" }, 400);
    }

    const { error } = await supabase
      .from(targetTable)
      .update(cleanPayload)
      .eq("id", targetId);
    if (error) {
      console.error("Update failed", error);
      return jsonResponse({ error: error.message }, 400);
    }
    return jsonResponse({ ok: true });
  }

  if (body.action === "delete") {
    const { error } = await supabase
      .from(targetTable)
      .delete()
      .eq("id", targetId);
    if (error) {
      console.error("Delete failed", error);
      return jsonResponse({ error: error.message }, 400);
    }
    // Revoca il token così l'URL non funziona più
    await supabase
      .from("edit_tokens")
      .update({ revoked: true })
      .eq("token", body.token);
    return jsonResponse({ ok: true });
  }

  return jsonResponse({ error: "unhandled action" }, 400);
});

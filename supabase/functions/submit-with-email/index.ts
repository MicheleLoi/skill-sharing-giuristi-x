// Edge Function: submit-with-email
//
// Riceve un payload di pubblicazione (skill / review / error), inserisce nel DB
// e, se è una review o un error con email fornita, genera un edit_token UUID e
// manda al ricevente un'email con il link permanente di modifica/cancellazione.
//
// Endpoint: POST https://<project>.supabase.co/functions/v1/submit-with-email
//
// Body JSON:
//   {
//     "kind": "skill" | "review" | "error",
//     "email": "user@example.com" | null,
//     "payload": { ... fields specifici al kind ... }
//   }
//
// Response:
//   { ok: true, id: "<uuid>", edit_token_sent: boolean }
//
// Secrets richiesti (Supabase dashboard → Settings → Edge Functions → Secrets):
//   - RESEND_API_KEY
//   - SUPABASE_URL (auto)
//   - SUPABASE_SERVICE_ROLE_KEY (auto)
//
// Deploy: dashboard → Edge Functions → Create function → name "submit-with-email"
//         → paste questo file → Deploy.

// deno-lint-ignore-file
// @ts-nocheck

import { createClient } from "https://esm.sh/@supabase/supabase-js@2.45.0";

const SITE_URL = "https://micheleloi.github.io/skill-sharing-giuristi-x";

interface SkillPayload {
  slug: string;
  title: string;
  author_name: string;
  anonymous: boolean;
  area: string;
  ai_compatibility?: string[];
  description: string;
  content: string;
  github_url?: string | null;
  references_text?: string | null;
  // Pacchetto submission_mode + license (SID-20260604-152531, ratificato post-strategist).
  submission_mode?: "self" | "colleague" | "external";
  license?:
    | "CC-BY-SA-4.0"
    | "CC-BY-4.0"
    | "CC-BY-NC-4.0"
    | "CC0-1.0"
    | "Proprietary"
    | "MIT"
    | "Apache-2.0"
    | "GPL-3.0"
    | "AGPL-3.0"
    | "TBD";
  original_author_name?: string | null;
  tool_url?: string | null;
  artifact_type?: string | null;
}

const ALLOWED_SUBMISSION_MODES = new Set(["self", "colleague", "external"]);
const ALLOWED_LICENSES = new Set([
  "CC-BY-SA-4.0",
  "CC-BY-4.0",
  "CC-BY-NC-4.0",
  "CC0-1.0",
  "Proprietary",
  "MIT",
  "Apache-2.0",
  "GPL-3.0",
  "AGPL-3.0",
  "TBD",
]);

interface ReviewPayload {
  skill_id: string;
  stars: number;
  text: string;
  author_name: string;
  anonymous: boolean;
}

interface ErrorPayload {
  slug: string;
  title: string;
  ai_tool: string;
  area: string;
  author_name: string;
  anonymous: boolean;
  description: string;
  prompt: string;
  wrong_answer: string;
  correction: string;
  references_text?: string | null;
}

interface ReqBody {
  kind: "skill" | "review" | "error";
  email?: string | null;
  payload: SkillPayload | ReviewPayload | ErrorPayload;
}

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

async function sendEditEmail(args: {
  apiKey: string;
  to: string;
  kind: "review" | "error";
  token: string;
}): Promise<void> {
  const kindLabel = args.kind === "review" ? "recensione" : "segnalazione errore";
  const link = `${SITE_URL}/edit.html?token=${args.token}`;
  const subject = `Modifica/cancella la tua ${kindLabel} — SkillAdvisor`;
  const text = `Ciao,

hai appena pubblicato una ${kindLabel} su SkillAdvisor.

Se in futuro vuoi modificare o cancellare il tuo contributo, usa questo link permanente:

${link}

Conservalo — è l'unico modo per editare il tuo contributo senza dover passare dal maintainer del sito.

Il link non scade per 365 giorni.

—
SkillAdvisor (prototipo, ospitato come regalo al gruppo Giuristi AI)
`;
  const html = `<p>Ciao,</p>
<p>hai appena pubblicato una ${kindLabel} su SkillAdvisor.</p>
<p>Se in futuro vuoi modificare o cancellare il tuo contributo, usa questo link permanente:</p>
<p><a href="${link}">${link}</a></p>
<p>Conservalo — è l'unico modo per editare il tuo contributo senza dover passare dal maintainer del sito.</p>
<p>Il link non scade per 365 giorni.</p>
<hr>
<p style="color:#888;font-size:12px;">SkillAdvisor (prototipo, ospitato come regalo al gruppo Giuristi AI)</p>`;

  const res = await fetch("https://api.resend.com/emails", {
    method: "POST",
    headers: {
      Authorization: `Bearer ${args.apiKey}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      from: "SkillAdvisor <onboarding@resend.dev>",
      to: [args.to],
      subject,
      text,
      html,
    }),
  });

  if (!res.ok) {
    const errBody = await res.text();
    console.error("Resend send failed", res.status, errBody);
    throw new Error(`Resend failed ${res.status}: ${errBody}`);
  }
}

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

  if (!body || !body.kind || !body.payload) {
    return jsonResponse({ error: "missing kind or payload" }, 400);
  }
  if (!["skill", "review", "error"].includes(body.kind)) {
    return jsonResponse({ error: "kind must be skill|review|error" }, 400);
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

  const table = body.kind === "skill" ? "skills"
    : body.kind === "review" ? "reviews"
    : "errors";

  // Auto-slug per skill/error se non fornito
  const payload: Record<string, unknown> = { ...body.payload };
  if ((body.kind === "skill" || body.kind === "error") && !payload.slug) {
    const titleSrc = String(payload.title || "");
    payload.slug = titleSrc
      .toLowerCase()
      .normalize("NFD")
      .replace(/[̀-ͯ]/g, "")
      .replace(/[^a-z0-9]+/g, "-")
      .replace(/^-|-$/g, "")
      .substring(0, 80) + "-" + Math.random().toString(36).slice(2, 8);
  }

  // Validation + sanitization dei nuovi campi skill (SID-20260604-152531).
  // submission_mode + license sono enum vincolati anche a livello DB (CHECK constraint).
  // Lato edge facciamo early reject per messaggi di errore piu' chiari al client.
  if (body.kind === "skill") {
    if (payload.submission_mode !== undefined && payload.submission_mode !== null) {
      if (!ALLOWED_SUBMISSION_MODES.has(String(payload.submission_mode))) {
        return jsonResponse(
          { error: `submission_mode invalid: ${payload.submission_mode}` },
          400,
        );
      }
    }
    if (payload.license !== undefined && payload.license !== null) {
      if (!ALLOWED_LICENSES.has(String(payload.license))) {
        return jsonResponse(
          { error: `license invalid: ${payload.license}` },
          400,
        );
      }
    }
    // Normalizza optional fields a null se stringhe vuote.
    if (payload.original_author_name === "") payload.original_author_name = null;
    if (payload.tool_url === "") payload.tool_url = null;
  }

  const { data: inserted, error: insertErr } = await supabase
    .from(table)
    .insert(payload)
    .select("id")
    .single();

  if (insertErr) {
    console.error("Insert failed", insertErr);
    return jsonResponse({ error: insertErr.message }, 400);
  }
  const insertedId = (inserted as { id: string }).id;

  // Edit token + email solo per review/error con email fornita
  let editTokenSent = false;
  if (body.email && body.kind !== "skill") {
    const { data: tokenRow, error: tokenErr } = await supabase
      .from("edit_tokens")
      .insert({
        target_type: body.kind, // 'review' | 'error'
        target_id: insertedId,
        email_recipient: body.email,
      })
      .select("token")
      .single();

    if (tokenErr) {
      console.error("Token insert failed", tokenErr);
      // Non blocchiamo la submission per questo
    } else {
      try {
        const resendKey = Deno.env.get("RESEND_API_KEY");
        if (!resendKey) {
          console.error("RESEND_API_KEY missing — skip email");
        } else {
          await sendEditEmail({
            apiKey: resendKey,
            to: body.email,
            kind: body.kind,
            token: (tokenRow as { token: string }).token,
          });
          editTokenSent = true;
        }
      } catch (e) {
        console.error("Email send failed", e);
        // Token creato anche se email fallita — utente può richiedere reinvio al maintainer
      }
    }
  }

  return jsonResponse({ ok: true, id: insertedId, edit_token_sent: editTokenSent });
});

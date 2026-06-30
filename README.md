# Yousef Nabil

**AI builder | voice & connector engineer | Doha, Qatar**

I build AI systems that take real action: dialect-speaking voice agents that run a
live website by voice, secure two-way connectors, and MCP servers that expose real
tools to AI agents. Shipped fast with Claude Code, hardened by a security background.

[![Email](https://img.shields.io/badge/Email-D14836?logo=gmail&logoColor=white)](mailto:yousefnabil8388@gmail.com)
[![GitHub](https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white)](https://github.com/YousefNabil-SOC)
[![Portfolio](https://img.shields.io/badge/Portfolio-pixeldhow.com-1f6feb)](https://pixeldhow.com)

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?logo=typescript&logoColor=white)
![Next.js](https://img.shields.io/badge/Next.js-000000?logo=nextdotjs&logoColor=white)
![React](https://img.shields.io/badge/React-20232A?logo=react&logoColor=61DAFB)
![Node.js](https://img.shields.io/badge/Node.js-339933?logo=nodedotjs&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3FCF8E?logo=supabase&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Prisma](https://img.shields.io/badge/Prisma-2D3748?logo=prisma&logoColor=white)
![Gemini](https://img.shields.io/badge/Gemini%20Live-8E75B2?logo=googlegemini&logoColor=white)
![MCP](https://img.shields.io/badge/MCP-000000)

---

## Selected work -- shipped and live

### Suhail -- live in-browser dialect voice agent (pixeldhow.com)
A real-time voice agent running on my agency site. It speaks the visitor's own
language and Gulf dialect, and takes real action on the page -- it navigates,
fills, and submits the live booking form, hands-free. Not a chat widget: it turns
spoken intent straight into action on a real interface.
- Live: https://pixeldhow.com

### Ayni -- AI host for ANANA CAFE, Doha (live)
A production voice host for a real Doha cafe. Ayni speaks fluent Qatari / Khaleeji
Arabic and mirrors whatever language the guest uses, recommends from the real menu,
and drives the website by voice through a tool-calling layer -- opening product
pages, switching the site language, navigating sections, and showing the cart, and
narrating each move. Engineered for trust:
- Answers are grounded only in the real menu and business data -- no invented
  items, prices, or facts.
- The model API key never reaches the browser: the server mints single-use,
  short-lived ephemeral tokens for each voice session.
- Prompt-injection attempts are refused; requests are rate-limited and
  same-origin guarded; the action tools are reversible by design (it can show, but
  never place an order or edit the cart).
- Stack: Next.js 16, React 19, TypeScript, Tailwind v4, GSAP, Three.js, Google
  Gemini Live.
- Live: https://anana-website.vercel.app

### doo-contact-sync -- production two-way connector + MCP server
A deployed HubSpot to Postgres two-way contact connector: real OAuth 2.0 with
automatic token refresh, HMAC signature-verified webhooks, idempotent sync with a
Postgres ledger (no loops, no duplicates), last-write-wins conflict resolution,
429/5xx retry-with-backoff, a health endpoint, and structured logging with secret
redaction. A bundled MCP server exposes the connector's actions (create / find /
sync contacts) as tools an AI agent can call. Unit + integration tests, OpenAPI docs.
- Code: https://github.com/YousefNabil-SOC/doo-contact-sync
- Live: https://doo-contact-sync.vercel.app

### claude-apex -- my Claude Code build environment (public, MIT)
A public mirror of the agent environment I build in: a routing layer over skills,
agents, commands, and MCP servers, on top of a curated original core. It reflects
how I approach agent routing, MCP integration, and developer tooling at scale.
- Code: https://github.com/YousefNabil-SOC/claude-apex

Also: GCC Arabic AI systems -- Arabic document-intelligence and automation over
real business data (client work; details confidential). And OpenJarvis, an
in-progress local-first agent-orchestration system (honest status: in progress,
not yet production).

---

## Builders League -- founding season

I am building for the founding season's open missions. Rather than claim them
before they are shipped, here is the foundation I already bring to the hard
question each one asks:

| Mission | What I already bring |
| --- | --- |
| Beyond the Chatbot | Suhail and Ayni: live voice agents that replace the chat box with intent-to-action |
| The Agent That Earns Trust | grounded answers, ephemeral credentials, injection refusal, signature-verified webhooks, least-privilege -- my security background is the core |
| The Decision Engine | permission-to-act logic, fail-closed gating, signature verification before trusting any event |
| The Agent Control Tower | MCP tool servers + structured logging and audit -- real oversight of real actions |
| Memory That Knows It Might Be Wrong | grounded retrieval over a single source of truth (no invented facts), provenance discipline |
| The Adaptive Agent | tool-driven agents that read live state and act on it safely and reversibly |
| The Autonomous Company Simulator | two-way sync, ledgers, idempotency -- accountable system loops over real data |
| Simulate Before You Act | reversible, narrated actions and dry-run / confirm boundaries in my voice agents |

Every mission I ship will be original, deployed, tested, documented, and paired
with a real failure test -- built to a production bar.

---

## Security backbone -- my edge
I come from detection and response, and it shows in what I build: least-privilege
scopes, secrets kept out of the browser and out of source, signature verification,
prompt-injection hardening, and reproducible, documented changes.
- SOC alert triage and SIEM hunting (Sentinel / Splunk / Elastic / KQL),
  vulnerability management, Windows hardening.
- Incident-response case files (lab / synthetic):
  https://github.com/YousefNabil-SOC/incident-reports
- Credentials: (ISC)2 Certified in Cybersecurity (CC); CompTIA CySA+ (in
  progress); Google Cybersecurity Certificate.

## Background
B.Sc. Computer Science (Information Technology), Egyptian E-Learning University,
2025. Founder and Digital Director of Pixeldhow (Doha). Based in Doha, Qatar.

---
**BUILD. CONNECT. SECURE.**

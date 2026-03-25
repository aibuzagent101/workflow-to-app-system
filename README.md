# Workflow-to-App System 🚀

**Convert customer workflows (n8n, Zapier, Trigger.dev) into production-ready Next.js web apps in 4-5 hours.**

A complete, repeatable business system for building web forms that integrate with workflow automation platforms. Ideal for service businesses, intake forms, lead capture, and customer onboarding.

---

## What This Is

A **production-grade template system** with automated scaffolding, comprehensive documentation, and deployment pipeline. Everything you need to take a customer's workflow automation and wrap it with a professional web interface.

**Core Features:**
- ✅ **Smart form generator** — Dynamically create forms from field lists
- ✅ **Webhook integration** — n8n, Zapier, Trigger.dev support
- ✅ **Next.js 14 + TypeScript** — Modern React stack
- ✅ **Vercel deployment** — One-click production deploy
- ✅ **Full documentation** — 5-phase process guide + interactive checklists
- ✅ **Automated scaffolding** — `generate-project.sh` spins up new projects in 1 minute

**What You Get:**
- Responsive form UI (mobile-friendly)
- Client-side validation
- API route for webhook forwarding
- Environment configuration templates
- Mock data for testing
- Git initialization
- README for each project
- Production-ready in <5 hours

---

## 30-Second Start

```bash
cd scripts

./generate-project.sh \
  --client "Your Client" \
  --project "client-intake" \
  --fields "name,email,phone,service,date,payment" \
  --platform "n8n" \
  --webhook "https://your-webhook-url"

cd client-intake
npm install
npm run dev
# → http://localhost:3000
```

---

## Full Workflow (4-5 hours)

### Phase 1: Discovery (45 min)
- [ ] Interview client about their automation
- [ ] Document all form fields needed
- [ ] Get webhook URL (n8n/Zapier/Trigger.dev)
- [ ] Verify integrations (emails, sheets, APIs)

### Phase 2: Build (2-3 hours)
- [ ] Run `generate-project.sh` with client details
- [ ] Customize form fields (optional)
- [ ] Test locally with mock data

### Phase 3: Testing (30 min)
- [ ] Fill and submit form
- [ ] Verify workflow processes data
- [ ] Check emails, sheets, integrations
- [ ] Test error handling

### Phase 4: Deploy (15 min)
- [ ] Push to GitHub
- [ ] Connect to Vercel
- [ ] Add environment variables
- [ ] Go live

### Phase 5: Handoff (10 min)
- [ ] Provide live URL
- [ ] Explain Vercel dashboard
- [ ] Document how to update fields
- [ ] Set up support channel

**Total Time:** 4-5 hours per project
**Bill:** $500-1,500 depending on complexity

---

## File Structure

```
workflow-to-app-system/
├── README.md                    ← You are here
├── PROCESS.md                   ← Detailed 5-phase guide (2,500+ words)
├── CHECKLIST.md                 ← Interactive project tracker
│
├── scripts/
│   └── generate-project.sh      ← Smart project scaffolder
│
├── template/
│   └── workflow-to-app-system/  ← Base Next.js boilerplate
│       ├── src/
│       │   ├── app/
│       │   │   ├── page.tsx         (dynamic form)
│       │   │   ├── layout.tsx       (metadata)
│       │   │   ├── globals.css      (responsive styles)
│       │   │   └── api/submit-intake/route.ts  (webhook forwarder)
│       │   └── mocks/
│       │       └── intake.json      (test data)
│       ├── package.json
│       ├── tsconfig.json
│       ├── next.config.js
│       ├── postcss.config.js
│       └── .gitignore
│
└── examples/
    └── ghcs-intake-form/        ← Real production project
        ├── Live: https://ghcs-intake-form.vercel.app
        └── Repo: github.com/aibuzagent101/workflow-to-app-system
```

---

## Supported Platforms

| Platform | Type | Integration | Best For |
|----------|------|-------------|----------|
| **n8n** | Self-hosted/Cloud | Webhook (HTTP POST) | Full control, automations |
| **Zapier** | Cloud SaaS | Webhook (HTTP POST) | Quick setup, 5,000+ integrations |
| **Trigger.dev** | Cloud SDK | TypeScript SDK | Complex logic, custom tasks |

### Integration Flow Examples

**n8n/Zapier (Webhook):**
```
Web Form → POST /api/submit-intake → n8n Webhook →
  → Send Email → Google Sheets → Return 200 OK
```

**Trigger.dev (SDK):**
```
Web Form → POST /api/submit-intake → tasks.trigger("process-intake") →
  → TypeScript Task (full logic) → Return Result
```

---

## How to Use This System

### For Your First Project
1. Read **PROCESS.md** (understand each phase)
2. Open **CHECKLIST.md** (track your progress)
3. Run `./generate-project.sh` (scaffold app)
4. Customize and deploy

### For Future Projects
1. Print **CHECKLIST.md** (one per client)
2. Run `./generate-project.sh` (with client details)
3. Follow checklist items
4. Deliver live URL to client

---

## Technology Stack

- **Frontend:** Next.js 14, React 18, TypeScript
- **Styling:** Plain CSS (minimal, fast, no dependencies)
- **Runtime:** Node.js (Vercel serverless)
- **Forms:** HTML5 with client-side validation
- **Deployment:** Vercel + GitHub

**Why this stack?**
- Minimal dependencies = Fast builds, low cost
- Next.js = Built-in API routes for webhook forwarding
- Vercel = Automatic deployments, no DevOps
- TypeScript = Type-safe forms and API handlers

---

## Cost Breakdown

**Per Project (4-5 hours billed at $150/hr):**
- Discovery & Planning: ~$110 (45 min)
- Build: ~$450-675 (3-4.5 hours)
- Testing & Deploy: ~$110 (45 min)
- **Total: $670-895 per project**

**Suggested Client Pricing:**
- Small (3-4 fields): $500
- Medium (5-6 fields): $750
- Large (7+ fields + customization): $1,000-1,500
- Monthly support/updates: $100-300

---

## Generated Project Structure

Each new project includes:

```
client-intake-form/
├── README.md                    ← Setup instructions
├── package.json                 ← Auto-generated with client name
├── .env.local.template          ← Copy to .env.local
├── .gitignore                   ← Protects .env.local + secrets
├── tsconfig.json
├── next.config.js
├── postcss.config.js
├── src/
│   ├── app/
│   │   ├── page.tsx            ← CUSTOM FORM (auto-generated)
│   │   ├── layout.tsx
│   │   ├── globals.css
│   │   └── api/
│   │       └── submit-intake/
│   │           └── route.ts    ← Webhook forwarder
│   └── mocks/
│       └── intake.json         ← Test data
└── .git/                        ← Git repo initialized
```

---

## Common Customizations

**Change form styling:**
- Edit `src/app/globals.css` (plain CSS, no dependencies)

**Add/remove fields:**
- Edit `src/app/page.tsx` (React form component)

**Change success message:**
- Edit success message text in `page.tsx`

**Add custom validation:**
- Modify `handleSubmit()` in `page.tsx`

**Change form title:**
- Edit `.logo` div in `page.tsx`

---

## Example: GHCS Intake Form

This system's first real-world project.

**Details:**
- **Client:** Genuine Home Care Services (GHCS)
- **Live:** https://ghcs-intake-form.vercel.app
- **Repo:** github.com/aibuzagent101/workflow-to-app-system
- **Platform:** n8n
- **Status:** ✅ Production (live since March 2026)

**Features:**
- 6 form fields (name, email, phone, service, date, payment)
- Auto-reply emails to users
- Notifications to caresupport@genuinehomecareservices.com
- Data stored in Google Sheets
- Claude API for AI analysis of submissions
- Responsive design (mobile + desktop)

**Build Time:** ~4 hours (including n8n workflow setup)

**Integrations:**
- n8n (webhook automation)
- Gmail (auto-reply + notifications)
- Google Sheets (lead storage)
- Claude API (smart analysis)

---

## Troubleshooting

### "Form won't submit"
- Check `.env.local` has correct `WEBHOOK_URL`
- Verify webhook URL is active and accepting POST requests
- Check browser console for errors (F12)

### "Workflow doesn't receive data"
- Test webhook directly: `curl -X POST [webhook-url] -d '{...}'`
- Check workflow is Published/Active in n8n/Zapier
- Review workflow logs for errors

### "Email not sending"
- Verify Gmail credentials in workflow (n8n: check Gmail node)
- Check spam folder
- Review email node configuration

### "Vercel deployment fails"
- Check build logs: https://vercel.com/dashboard
- Verify `package.json` has all dependencies
- Ensure no `.env.local` secrets in git

### "Form looks broken on mobile"
- Check `globals.css` responsive classes
- Test with browser DevTools (F12 → mobile view)
- Most issues fixed by CSS adjustments

---

## MCP Resources

Two MCP servers available in `.mcp.json`:

**1. n8n MCP** — Inspect workflows, test webhooks
```json
{
  "type": "http",
  "url": "https://aibizpro.app.n8n.cloud/mcp-server/http",
  "authorization": { "type": "bearer", "token": "..." }
}
```

**2. Trigger.dev MCP** — Manage tasks and deployments
```json
{
  "command": "npx",
  "args": ["trigger.dev@4.4.0", "mcp"]
}
```

Use these to audit workflows and verify integrations before deployment.

---

## Future Roadmap

- [ ] Multi-step forms (wizard mode)
- [ ] File upload support
- [ ] Database storage (optional)
- [ ] Advanced validation (regex, custom rules)
- [ ] Payment integration (Stripe)
- [ ] Email template customization
- [ ] Form submission analytics dashboard
- [ ] Zapier/Make.com templates
- [ ] Custom styling templates (brand kits)

---

## Getting Started

```bash
# 1. Review the process
cat PROCESS.md

# 2. Check the checklist template
cat CHECKLIST.md

# 3. Generate your first project
cd scripts
chmod +x generate-project.sh
./generate-project.sh \
  --client "Test Client" \
  --project "test-form" \
  --fields "name,email,message" \
  --platform "n8n" \
  --webhook "https://example.com/webhook"

# 4. Test locally
cd test-form
npm install
npm run dev

# 5. Deploy (when ready)
git remote add origin https://github.com/YOU/test-form.git
git push -u origin main
# → Connect to Vercel at vercel.com

```

---

## Support

**For each project, provide clients with:**
1. Live URL (e.g., `https://client-intake.vercel.app`)
2. Link to Vercel dashboard (form submissions visible there)
3. Instructions for updating form fields (if needed)
4. Your support email for questions

**Monitor:**
- Vercel error logs (Logs tab in dashboard)
- Form submission rates
- Email delivery (check client's inbox + spam)
- Response times (<2s load, <5s submit)

---

**Status:** Production Ready ✅
**First Project:** GHCS Intake Form (Live March 2026)
**Tech Stack:** Next.js 14 + n8n + Vercel
**Time to Deploy:** 4-5 hours per project
**Ready to scale?** Start generating! 🚀

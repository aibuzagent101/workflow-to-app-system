# Workflow-to-App Process Guide

## Complete Process for Converting Workflows into Web Apps

---

## Phase 1: Discovery & Planning (45 min)

### 1.1 Client Onboarding Call
- [ ] Understand the business problem
- [ ] Identify current workflow platform (n8n, Zapier, Trigger.dev)
- [ ] Document all form fields needed
- [ ] Clarify integrations (email, sheets, API calls, etc)
- [ ] Set success metrics

### 1.2 Workflow Audit
- [ ] Access client's workflow/automation
- [ ] Map out data flow (input → processing → output)
- [ ] Identify webhook URLs or Trigger.dev task IDs
- [ ] Check for required integrations (Gmail, Sheets, APIs)
- [ ] Verify API credentials are available

### 1.3 Requirements Document
Create a simple form spec:
```
Project: [Client Name] [App Name]
Platform: [n8n / Zapier / Trigger.dev]
Webhook URL: [URL or Trigger.dev task ID]

Form Fields:
1. Name (text, required)
2. Email (email, required)
3. Phone (tel, required)
4. Service Type (select: Option A, Option B, Option C)
5. Date Preference (date, required)
6. Payment Method (select: Cash, Card, Insurance)

Integrations:
- Auto-reply email to user
- Notification to: support@company.com
- Store data in Google Sheets
- [Custom: ...]

Success Criteria:
- Form submits without errors
- User receives auto-reply email within 2 min
- Data appears in Google Sheets
- Admin receives notification
```

---

## Phase 2: Build (2-3 hours)

### 2.1 Project Setup
```bash
./generate-project.sh \
  --client "Client Name" \
  --project "project-name" \
  --fields "name,email,phone,serviceType,datePreference,paymentMethod" \
  --platform "n8n" \
  --webhook "https://..."
```

This creates:
- Next.js project with all boilerplate
- Pre-filled form fields
- API route configured with webhook URL
- .env.local template
- Git repo initialized

### 2.2 Customize Form
Edit `src/app/page.tsx`:
- Add/remove/reorder fields
- Adjust validation rules
- Customize success message
- Update styling if needed

### 2.3 Test Locally
```bash
cd project-name
npm install
npm run dev
```

Visit `http://localhost:3000`:
- [ ] Fill form with test data
- [ ] Submit successfully
- [ ] See success message

### 2.4 Connect to Real Workflow
Update `.env.local`:
```
N8N_WEBHOOK_URL=https://actual-webhook-url
```

Test again → verify workflow receives data → check integrations

---

## Phase 3: Testing & Validation (30 min)

### 3.1 End-to-End Testing
- [ ] Fill form → Submit
- [ ] Check user receives auto-reply email
- [ ] Check admin receives notification
- [ ] Check data in Google Sheets
- [ ] Check response shows on frontend

### 3.2 Error Testing
- [ ] Try submitting empty form (should fail)
- [ ] Try invalid email (should fail)
- [ ] Try with network error (should show error message)

### 3.3 Performance Check
- [ ] Form loads in <2 seconds
- [ ] Submit completes in <5 seconds
- [ ] No console errors

---

## Phase 4: Deploy to Production (15 min)

### 4.1 GitHub Setup
```bash
cd project-name
git add .
git commit -m "Initial project setup"
git remote add origin https://github.com/CLIENT_ORG/project-name.git
git push -u origin main
```

### 4.2 Vercel Deployment
1. Go to https://vercel.com
2. Click "New Project"
3. Select GitHub repo
4. Click "Deploy"
5. Add `.env.local` variables (webhook URL)
6. Deploy completes → live URL provided

### 4.3 Production Testing
- [ ] Visit live URL
- [ ] Fill and submit form
- [ ] Verify workflow processes data
- [ ] Send final report to client

---

## Phase 5: Handoff & Maintenance (10 min)

### 5.1 Deliver to Client
- [ ] Live URL
- [ ] How to access logs (Vercel dashboard)
- [ ] How to update form fields
- [ ] How to view submissions

### 5.2 Ongoing Support
- Monitor error rates
- Respond to issues within 24 hours
- Minor updates (field changes): 30 min
- Major updates (new integrations): quote separately

---

## Common Workflows by Platform

### n8n Workflow Example
Webhook → Parse Form → Send Email → Google Sheets → Response

### Zapier Workflow Example  
Webhook → Format Data → Email Notification → Sheets → Done

### Trigger.dev Workflow Example
```ts
// trigger/process-intake.ts
export const processIntake = task({
  id: "process-intake",
  run: async (payload) => {
    // Send email
    // Save to sheets
    // Custom logic in TypeScript
    return { success: true };
  },
});
```

---

## Troubleshooting

**Form doesn't submit:**
- Check webhook URL in .env.local
- Verify workflow is active and accepting webhooks
- Check browser console for errors

**Workflow doesn't process:**
- Verify webhook URL is correct
- Check workflow logs in n8n/Zapier/Trigger.dev
- Test webhook directly with curl

**Email not sending:**
- Verify Gmail/SMTP credentials in workflow
- Check spam folder
- Review workflow email node configuration

---

## Estimated Timeline
- Discovery: 45 min
- Build: 2-3 hours
- Testing: 30 min
- Deploy: 15 min
- **Total: 4-5 hours per project**


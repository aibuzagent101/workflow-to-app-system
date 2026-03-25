# Workflow-to-App Project Checklist

Quick reference for executing projects. Print or copy for each new client.

---

## CLIENT INFO
```
Client Name: _________________
Project Name: _________________
Platform: [ ] n8n  [ ] Zapier  [ ] Trigger.dev
Webhook URL: _________________
GitHub Org: _________________
Contact Email: _________________
```

---

## WORKFLOW PLATFORM SETUP (Before Phase 1)

### Webhook Configuration
- [ ] Workflow created in n8n/Zapier/Trigger.dev
- [ ] Webhook endpoint created and URL obtained
- [ ] Webhook tested manually (e.g., with curl or Postman)
- [ ] Workflow set to Active/Published state

### Required Integrations (n8n example)
- [ ] **Gmail credentials**: Connected for auto-reply emails
- [ ] **Gmail credentials**: Connected for admin notifications
- [ ] **Google Sheets**: "GHCS leads" sheet accessible
- [ ] **Anthropic API key**: Added to HTTP Request node (if using Claude)
- [ ] **HTTP Response node**: Configured to return 200 status

### Integration Verification
- [ ] Test workflow with sample payload
- [ ] Auto-reply email test (check spam folder)
- [ ] Admin notification email test
- [ ] Google Sheets data entry verified
- [ ] Workflow logs show no errors

---

## PHASE 1: DISCOVERY & PLANNING (45 min)

### Discovery
- [ ] Initial call completed
- [ ] Business problem understood
- [ ] Form fields documented (list below)
- [ ] Integrations identified (email, sheets, APIs)

### Form Fields
```
Required Fields:
1. _______________________
2. _______________________
3. _______________________
4. _______________________
5. _______________________
6. _______________________
```

### Workflow Audit
- [ ] Workflow reviewed and understood
- [ ] Webhook URL obtained and tested
- [ ] All integrations verified working
- [ ] Gmail credentials confirmed
- [ ] Google Sheets access confirmed
- [ ] n8n/Zapier/Trigger.dev account access verified

### Setup
- [ ] GitHub repo created (`github.com/CLIENT_ORG/project-name`)
- [ ] Vercel account connected to GitHub
- [ ] Team members assigned
- [ ] Communication channel established

---

## PHASE 2: BUILD (2-3 hours)

### Project Generation
```bash
./generate-project.sh \
  --client "CLIENT_NAME" \
  --project "project-name" \
  --fields "field1,field2,field3,field4,field5,field6" \
  --platform "n8n" \
  --webhook "WEBHOOK_URL"
```
- [ ] Command executed successfully
- [ ] Project directory created
- [ ] No errors in output

### Customization
- [ ] Form fields match spec (edit `src/app/page.tsx`)
- [ ] Field labels are clear and user-friendly
- [ ] Validation rules appropriate
- [ ] Success message customized
- [ ] CSS styling matches brand (optional)

### Local Testing
```bash
cd project-name
npm install
npm run dev
# Visit http://localhost:3000
```
- [ ] npm install completes without errors
- [ ] Dev server starts successfully
- [ ] Form loads in browser
- [ ] Form fields render correctly
- [ ] Form submits with test data
- [ ] Success message appears
- [ ] No console errors

### Connect to Real Webhook
- [ ] Webhook URL added to `.env.local`
- [ ] Form resubmitted with real webhook
- [ ] Workflow receives data (check logs)
- [ ] All integrations trigger (emails, sheets, etc)

---

## PHASE 3: TESTING & VALIDATION (30 min)

### Happy Path Testing
1. Fill out all fields with valid data
   - [ ] Name: _______________
   - [ ] Email: _______________
   - [ ] Phone: _______________
   - [ ] Date: _______________
   - [ ] Type: _______________
   - [ ] Payment: _______________
2. [ ] Form submits successfully
3. [ ] Success message displays
4. [ ] Check user received auto-reply email
5. [ ] Check admin received notification
6. [ ] Check data in Google Sheets
7. [ ] All integrations worked

### Error Testing
- [ ] Submit with empty name → Error shown
- [ ] Submit with invalid email → Error shown
- [ ] Submit with invalid phone → Error shown
- [ ] Network error handled gracefully
- [ ] Error messages are clear

### Performance Testing
- [ ] Form loads in <2 seconds
- [ ] Submit completes in <5 seconds
- [ ] Page is responsive on mobile
- [ ] No console errors

### Cross-Browser Testing
- [ ] Works in Chrome
- [ ] Works in Firefox
- [ ] Works in Safari
- [ ] Works on mobile (iOS)
- [ ] Works on mobile (Android)

---

## PHASE 4: DEPLOY TO PRODUCTION (15 min)

### GitHub Commit
```bash
cd project-name
git add .
git commit -m "Initial project: workflow-to-app integration"
git push -u origin main
```
- [ ] All files committed
- [ ] No sensitive data in commit (check .gitignore)
- [ ] Push to GitHub successful
- [ ] GitHub repo has all files

### Vercel Deployment
1. [ ] Go to https://vercel.com
2. [ ] Click "New Project"
3. [ ] Select GitHub repo
4. [ ] Root directory is project root (default)
5. [ ] Add environment variables in Vercel dashboard:
   - [ ] `WEBHOOK_URL` = (n8n/Zapier webhook URL)
   - [ ] `PLATFORM` = "n8n" | "zapier" | "trigger.dev"
6. [ ] Click "Deploy"
7. [ ] Wait for deployment to complete
8. [ ] Verify production build succeeded
9. [ ] Vercel URL provided: _________________

### Production Validation
```
Live URL: https://________________________.vercel.app
```
- [ ] URL loads successfully
- [ ] Form submits from live URL
- [ ] Workflow processes data
- [ ] User receives auto-reply
- [ ] Admin receives notification
- [ ] Data in Google Sheets updated
- [ ] No errors in Vercel logs

---

## PHASE 5: HANDOFF & MAINTENANCE (10 min)

### Documentation
- [ ] Live URL provided to client
- [ ] Vercel dashboard access explained
- [ ] How to view form submissions explained
- [ ] How to update form fields (if applicable)
- [ ] Support contact provided

### Post-Launch
- [ ] Client tested the form themselves
- [ ] Client confirmed all integrations work
- [ ] Client signed off on delivery
- [ ] Invoice sent (if applicable)
- [ ] Project marked as complete

### Follow-up (Week 1)
- [ ] Check error rates in Vercel
- [ ] Monitor form submissions
- [ ] Respond to client questions <24h
- [ ] Schedule retrospective call (optional)

---

## NOTES & ISSUES

```
Issue 1: _________________________
Resolution: ______________________
Status: [ ] Open  [ ] Resolved

Issue 2: _________________________
Resolution: ______________________
Status: [ ] Open  [ ] Resolved

Issue 3: _________________________
Resolution: ______________________
Status: [ ] Open  [ ] Resolved
```

---

## PROJECT SUMMARY

**Start Date:** _______________
**End Date:** _______________
**Hours Spent:** _______________
**Client Satisfaction:** [ ] Very Happy  [ ] Happy  [ ] Neutral  [ ] Needs Work

**What Went Well:**
1. ________________________
2. ________________________
3. ________________________

**What to Improve Next Time:**
1. ________________________
2. ________________________

---

## TIMELINE REFERENCE

| Phase | Time | Deliverable |
|-------|------|-------------|
| **Phase 1** | 45 min | Discovery & requirements documented |
| **Phase 2** | 2-3 hrs | Next.js app built & customized |
| **Phase 3** | 30 min | All tests passing, integrations verified |
| **Phase 4** | 15 min | Live on Vercel, E2E tested |
| **Phase 5** | 10 min | Client handoff & documentation |
| **TOTAL** | **4-5 hours** | **Production-ready web app** |

## QUICK REFERENCE

**Generator Command:**
```bash
./generate-project.sh --client "Name" --project "slug" \
  --fields "field1,field2,field3" --platform "n8n" --webhook "URL"
```

**Test Form Submission:**
```bash
curl -X POST http://localhost:3000/api/submit-intake \
  -H "Content-Type: application/json" \
  -d '{"name":"Test","email":"test@example.com"}'
```

**View Logs:**
- Local: Browser console (F12) + terminal
- Production: https://vercel.com/dashboard (Logs tab)
- Workflow: n8n/Zapier/Trigger.dev dashboard


# Workflow-to-App System — Product Overview

## Overview
- **Product:** Next.js-based system for converting automation workflows into production-ready web applications
- **Target:** Service businesses, intake forms, lead capture, customer onboarding
- **Deployment time:** 4–5 hours per project
- **Pricing:** $500–$1,500 per project

## Technology Stack
- **Frontend:** Next.js 14 + React 18 + TypeScript
- **Styling:** Plain CSS (minimal, fast, no dependencies)
- **Runtime:** Node.js (Vercel serverless)
- **Forms:** HTML5 with client-side validation
- **Deployment:** Vercel + GitHub
- **Automation platforms:** n8n, Zapier, Trigger.dev (webhook-based)

## How It Works
1. **Smart scaffolder** (`generate-project.sh`) spins up a new project in <1 minute
2. **Dynamic form generator** creates responsive intake forms from field lists
3. **Webhook integration** forwards submissions to automation platform
4. **One-click Vercel deployment** with automatic updates from GitHub

## Revenue Model
- Per-project fee: $500–$1,500 depending on complexity
- Optional monthly support/updates: $100–300
- Billable to AIBizPros clients as a service add-on

## Use Cases
- Client intake automation
- Lead capture forms
- Service booking / appointment forms
- Application forms
- Feedback / survey forms
- Any form that needs to feed data into n8n, Zapier, or Trigger.dev

## Current Status
- **First production app:** GHCS Intake Form (live March 2026)
- **Platforms supported:** n8n, Zapier, Trigger.dev
- **Ready to scale:** Yes — system is documented and repeatable

## Tools & Integration
- GitHub — Source code and version control
- Vercel — Deployment and hosting
- n8n / Zapier / Trigger.dev — Automation platform integration
- Environment variables — Webhook URL, API keys stored securely

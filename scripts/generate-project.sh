#!/bin/bash

# Workflow-to-App Project Generator
# Usage: ./generate-project.sh --client "Client Name" --project "project-name" --fields "field1,field2,field3" --platform "n8n" --webhook "https://..."

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Default values
CLIENT_NAME=""
PROJECT_NAME=""
FIELDS=""
PLATFORM="n8n"
WEBHOOK_URL=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --client)
      CLIENT_NAME="$2"
      shift 2
      ;;
    --project)
      PROJECT_NAME="$2"
      shift 2
      ;;
    --fields)
      FIELDS="$2"
      shift 2
      ;;
    --platform)
      PLATFORM="$2"
      shift 2
      ;;
    --webhook)
      WEBHOOK_URL="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Validate required arguments
if [ -z "$CLIENT_NAME" ] || [ -z "$PROJECT_NAME" ] || [ -z "$FIELDS" ] || [ -z "$WEBHOOK_URL" ]; then
  echo -e "${RED}Error: Missing required arguments${NC}"
  echo "Usage: ./generate-project.sh --client 'Client Name' --project 'project-name' --fields 'field1,field2,field3' --platform 'n8n' --webhook 'https://...'"
  exit 1
fi

echo -e "${GREEN}🚀 Generating workflow-to-app project...${NC}"
echo "Client: $CLIENT_NAME"
echo "Project: $PROJECT_NAME"
echo "Platform: $PLATFORM"
echo ""

# Create project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo -e "${YELLOW}1/6 Creating project structure...${NC}"
mkdir -p src/app/api/submit-intake src/components src/mocks

echo -e "${YELLOW}2/6 Creating package.json...${NC}"
cat > package.json << PACKAGE
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "description": "$CLIENT_NAME - Workflow-to-App Integration",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "next": "^14.1.0"
  },
  "devDependencies": {
    "typescript": "^5.3.0",
    "@types/node": "^20.10.0",
    "@types/react": "^18.3.0",
    "@types/react-dom": "^18.3.0",
    "eslint": "^8.55.0",
    "eslint-config-next": "^14.1.0"
  }
}
PACKAGE

echo -e "${YELLOW}3/6 Creating configuration files...${NC}"
cat > tsconfig.json << 'TSCONFIG'
{
  "compilerOptions": {
    "target": "es2020",
    "lib": ["es2020", "dom", "dom.iterable"],
    "jsx": "preserve",
    "module": "esnext",
    "moduleResolution": "bundler",
    "allowJs": true,
    "strict": false,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "incremental": true,
    "plugins": [{ "name": "next" }]
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
TSCONFIG

cat > next.config.js << 'NEXTCONFIG'
const nextConfig = {
  reactStrictMode: true,
};
module.exports = nextConfig;
NEXTCONFIG

cat > postcss.config.js << 'POSTCSS'
module.exports = {
  plugins: {},
};
POSTCSS

echo -e "${YELLOW}4/6 Creating app files...${NC}"
cat > src/app/layout.tsx << 'LAYOUT'
import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Intake Form",
  description: "Workflow-to-App Intake Form",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
LAYOUT

cat > src/app/globals.css << 'CSS'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
}

body {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

main {
  width: 100%;
  max-width: 600px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  padding: 40px;
}

.logo {
  text-align: center;
  margin-bottom: 30px;
  font-size: 24px;
  font-weight: bold;
  color: #333;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 8px;
  color: #333;
  font-weight: 500;
  font-size: 14px;
}

input, select {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 14px;
  font-family: inherit;
}

input:focus, select:focus {
  outline: none;
  border-color: #667eea;
  box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

button {
  width: 100%;
  padding: 12px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  margin-top: 20px;
}

button:hover {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.success {
  background: #d4edda;
  border: 1px solid #c3e6cb;
  color: #155724;
  padding: 15px;
  border-radius: 6px;
  margin-bottom: 20px;
  text-align: center;
}

.error {
  color: #e74c3c;
  font-size: 13px;
  margin-top: 5px;
}
CSS

# Generate form fields
IFS=',' read -ra FIELD_ARRAY <<< "$FIELDS"

echo -e "${YELLOW}5/6 Creating dynamic form page...${NC}"
cat > src/app/page.tsx << 'PAGE'
"use client";

import { useState, FormEvent, ChangeEvent } from "react";

interface FormData {
PAGE

for field in "${FIELD_ARRAY[@]}"; do
  FIELD_CLEAN=$(echo "$field" | xargs)
  echo "  $FIELD_CLEAN: string;" >> src/app/page.tsx
done

cat >> src/app/page.tsx << 'PAGE'
}

export default function Home() {
  const [formData, setFormData] = useState<FormData>({
PAGE

for field in "${FIELD_ARRAY[@]}"; do
  FIELD_CLEAN=$(echo "$field" | xargs)
  echo "    $FIELD_CLEAN: \"\"," >> src/app/page.tsx
done

cat >> src/app/page.tsx << 'PAGE'
  });

  const [submitted, setSubmitted] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleChange = (e: ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));
    setError("");
  };

  const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    setError("");

    try {
      const response = await fetch("/api/submit-intake", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(formData),
      });

      if (!response.ok) throw new Error("Failed to submit");

      setSubmitted(true);
      setFormData({
PAGE

for field in "${FIELD_ARRAY[@]}"; do
  FIELD_CLEAN=$(echo "$field" | xargs)
  echo "        $FIELD_CLEAN: \"\"," >> src/app/page.tsx
done

cat >> src/app/page.tsx << 'PAGE'
      });

      setTimeout(() => setSubmitted(false), 5000);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Error submitting form");
    } finally {
      setLoading(false);
    }
  };

  return (
    <main>
      <div className="logo">📋 Intake Form</div>

      {submitted && (
        <div className="success">
          ✓ Thank you! Your submission has been received.
        </div>
      )}

      {error && <div className="error" style={{ marginBottom: "20px" }}>Error: {error}</div>}

      <form onSubmit={handleSubmit}>
PAGE

for field in "${FIELD_ARRAY[@]}"; do
  FIELD_CLEAN=$(echo "$field" | xargs)
  FIELD_LABEL=$(echo "$FIELD_CLEAN" | sed 's/\([A-Z]\)/ \1/g' | sed 's/^[a-z]/\U&/')
  
  cat >> src/app/page.tsx << FIELD_HTML
        <div className="form-group">
          <label htmlFor="$FIELD_CLEAN">$FIELD_LABEL *</label>
          <input
            id="$FIELD_CLEAN"
            type="text"
            name="$FIELD_CLEAN"
            value={formData.$FIELD_CLEAN}
            onChange={handleChange}
            required
          />
        </div>

FIELD_HTML
done

cat >> src/app/page.tsx << 'PAGE'
        <button type="submit" disabled={loading}>
          {loading ? "Submitting..." : "Submit"}
        </button>
      </form>
    </main>
  );
}
PAGE

echo -e "${YELLOW}Creating API route...${NC}"
cat > src/app/api/submit-intake/route.ts << "API_ROUTE"
import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const webhookUrl = process.env.WEBHOOK_URL || "$WEBHOOK_URL";

    const response = await fetch(webhookUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    });

    if (!response.ok) {
      return NextResponse.json(
        { error: "Failed to process" },
        { status: 500 }
      );
    }

    return NextResponse.json({
      success: true,
      message: "Submitted successfully",
    });
  } catch (error) {
    return NextResponse.json(
      { error: "Server error" },
      { status: 500 }
    );
  }
}
API_ROUTE

echo -e "${YELLOW}Creating environment template...${NC}"
cat > .env.local.template << "ENV"
# Webhook Configuration
WEBHOOK_URL=$WEBHOOK_URL
PLATFORM=$PLATFORM
ENV

echo -e "${YELLOW}6/6 Creating documentation and mock data...${NC}"

cat > README.md << "README"
# $CLIENT_NAME - Intake Form

Auto-generated workflow-to-app project for $CLIENT_NAME.

## Quick Start

\`\`\`bash
npm install
cp .env.local.template .env.local
npm run dev
\`\`\`

Visit: http://localhost:3000

## Configuration

Update \`.env.local\` with your webhook URL:
\`\`\`
WEBHOOK_URL=$WEBHOOK_URL
PLATFORM=$PLATFORM
\`\`\`

## Project Structure

- \`src/app/page.tsx\` - Main intake form
- \`src/app/api/submit-intake/route.ts\` - Webhook forwarder
- \`src/app/globals.css\` - Styles
- \`.env.local\` - Configuration (add after copying from template)

## Deployment

1. Push to GitHub
2. Connect to Vercel
3. Add environment variables in Vercel dashboard
4. Auto-deploys on git push

## Support

For issues or customization, contact your service provider.
README

cat > src/mocks/ghcs-intake.json << "MOCKDATA"
{
  "name": "John Smith",
  "email": "john@example.com",
  "phone": "555-1234",
  "datePreference": "2026-03-30",
  "serviceType": "Home Care",
  "paymentMethod": "Insurance"
}
MOCKDATA

cat > .gitignore << 'GITIGNORE'
node_modules/
.next/
.env.local
.vercel/
.DS_Store
next-env.d.ts
GITIGNORE

echo -e "${YELLOW}Initializing git...${NC}"
git init
git add .
git commit -m "Initial: Workflow-to-app project for $CLIENT_NAME"

echo ""
echo -e "${GREEN}✅ Project generated successfully!${NC}"
echo ""
echo -e "${GREEN}📦 What was created:${NC}"
echo "  ✓ Next.js 14 app with TypeScript"
echo "  ✓ Dynamic form with $((${#FIELD_ARRAY[@]})) fields"
echo "  ✓ API route for webhook forwarding"
echo "  ✓ Responsive styling"
echo "  ✓ Mock data for testing"
echo "  ✓ README and configuration"
echo ""
echo -e "${GREEN}🚀 Phase 2 - Next steps:${NC}"
echo "  1. cd $PROJECT_NAME"
echo "  2. npm install"
echo "  3. cp .env.local.template .env.local"
echo "  4. npm run dev (test locally at http://localhost:3000)"
echo ""
echo -e "${GREEN}✅ Phase 3 - Testing:${NC}"
echo "  • Fill form with test data"
echo "  • Verify workflow receives submission"
echo "  • Check emails and integrations"
echo ""
echo -e "${GREEN}📤 Phase 4 - Deploy:${NC}"
echo "  1. git remote add origin https://github.com/YOUR_ORG/$PROJECT_NAME.git"
echo "  2. git push -u origin main"
echo "  3. Connect to Vercel: https://vercel.com/new"
echo "  4. Add WEBHOOK_URL to Vercel environment"
echo ""
echo -e "${YELLOW}Platform: $PLATFORM${NC}"
echo -e "${YELLOW}Webhook: $WEBHOOK_URL${NC}"
echo ""


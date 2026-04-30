#!/bin/bash
# Ai-Agent-Framework v1.0.0
# macOS/Linux Bash equivalent for create-project.ps1

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
FRAMEWORK_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"
CONFIG_FILE="$(dirname "$SCRIPT_DIR")/config.json"
EXAMPLE_FILE="$(dirname "$SCRIPT_DIR")/config.example.json"

echo -e "\033[36m======================================\033[0m"
echo -e "\033[36m  Ai-Agent-Framework: Create New Project\033[0m"
echo -e "\033[36m======================================\033[0m"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "  config.json not found"
    echo "  Creating from config.example.json..."
    cp "$EXAMPLE_FILE" "$CONFIG_FILE"
    echo -e "\033[32m[OK] config.json created at: $CONFIG_FILE\033[0m"
fi

OWNER_NAME=$(grep -o '"name": "[^"]*' "$CONFIG_FILE" | cut -d'"' -f4 | head -1)
AI_PROVIDER=$(grep -o '"provider": "[^"]*' "$CONFIG_FILE" | cut -d'"' -f4 | head -1)

if [ -z "$OWNER_NAME" ]; then OWNER_NAME="YourName"; fi

read -p "[1/5] Project Name (English, a-z 0-9 - _ only): " PROJECT_NAME
if [[ ! "$PROJECT_NAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo -e "\033[31m[ERROR] Project name must be alphanumeric (a-z, 0-9, -, _ only). No spaces.\033[0m"
    exit 1
fi

DEFAULT_DIR="$(dirname "$FRAMEWORK_DIR")/$PROJECT_NAME"
read -p "[2/5] Project Path [$DEFAULT_DIR]: " TARGET_DIR
TARGET_DIR="${TARGET_DIR:-$DEFAULT_DIR}"

if [ -d "$TARGET_DIR" ]; then
    echo -e "\033[31m[ERROR] Directory already exists: $TARGET_DIR\033[0m"
    exit 1
fi

read -p "[3/5] Project Description: " PROJECT_DESC
read -p "[4/5] Domain (e.g. example.com) [Leave blank if none]: " DOMAIN_NAME
DOMAIN_NAME="${DOMAIN_NAME:-ยังไม่มีโดเมน}"

echo ""
echo "Creating project..."
TEMPLATE_DIR="$FRAMEWORK_DIR/templates/project-template"
cp -r "$TEMPLATE_DIR" "$TARGET_DIR"

if [ $? -ne 0 ]; then
    echo -e "\033[31m[ERROR] Failed to copy template.\033[0m"
    exit 1
fi

echo -e "\033[32m[OK] Template copied to: $TARGET_DIR\033[0m"

DATE_TODAY=$(date +%Y-%m-%d)

# Replace placeholders using perl (cross-platform reliable for macOS/Linux)
find "$TARGET_DIR" -type f -name "*.md" -o -name ".*rules" | while read -r file; do
    perl -pi -e "s/\[PROJECT_NAME\]/$PROJECT_NAME/g" "$file"
    perl -pi -e "s/\[PROJECT_DESCRIPTION\]/$PROJECT_DESC/g" "$file"
    perl -pi -e "s/\[DOMAIN\]/$DOMAIN_NAME/g" "$file"
    perl -pi -e "s/\[OWNER_NAME\]/$OWNER_NAME/g" "$file"
    perl -pi -e "s/\[YYYY-MM-DD\]/$DATE_TODAY/g" "$file"
    
    # Language injection
    if [ "$AI_PROVIDER" == "gemini" ]; then
        perl -pi -e "s/\[LANGUAGE\]/Thai/g" "$file"
    else
        perl -pi -e "s/\[LANGUAGE\]/English/g" "$file"
    fi
done

echo -e "\033[32m[OK] Placeholders updated.\033[0m"

read -p "[5/5] Initialize Git repository? (Y/n): " INIT_GIT
INIT_GIT="${INIT_GIT:-Y}"

if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
    cd "$TARGET_DIR" || exit
    git init > /dev/null 2>&1
    git add . > /dev/null 2>&1
    git commit -m "init: project setup from Ai-Agent-Framework template v1.0.0" > /dev/null 2>&1
    echo -e "\033[32m[OK] Git initialized and first commit created.\033[0m"
fi

echo ""
echo -e "\033[32m🎉 Project '$PROJECT_NAME' created successfully!\033[0m"
echo "Next steps:"
echo "  1. Open $TARGET_DIR in your IDE"
echo "  2. The AI assistant will automatically read AI_CONTEXT.md"

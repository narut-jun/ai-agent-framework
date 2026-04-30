#!/bin/bash
# Ai-Agent-Framework v1.0.0
# macOS/Linux Bash equivalent for show-status.ps1

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
FRAMEWORK_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

echo ""
echo -e "\033[36m======================================\033[0m"
echo -e "\033[36m  Ai-Agent-Framework Status\033[0m"
echo -e "\033[36m======================================\033[0m"

# Framework Info
VERSION_FILE="$FRAMEWORK_DIR/VERSION.md"
if [ -f "$VERSION_FILE" ]; then
    FW_VERSION=$(grep -E 'Framework Version.*\|' "$VERSION_FILE" | awk -F'|' '{print $3}' | xargs)
    KW_VERSION=$(grep -E 'Knowledge Version.*\|' "$VERSION_FILE" | awk -F'|' '{print $3}' | xargs)
    echo -e "  \033[32mFramework Version: $FW_VERSION\033[0m"
    echo -e "  \033[32mKnowledge Version: $KW_VERSION\033[0m"
fi

# Knowledge Files
echo ""
echo -e "  \033[33mKnowledge Files:\033[0m"
for sub in global-rules patterns skills; do
    DIR="$FRAMEWORK_DIR/knowledge/$sub"
    if [ -d "$DIR" ]; then
        COUNT=$(find "$DIR" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l)
        if [ "$COUNT" -gt 0 ]; then
            echo -e "    \033[32m[+] $sub/: $COUNT files\033[0m"
        else
            echo -e "    \033[90m[ ] $sub/: 0 files\033[0m"
        fi
    fi
done

# Brain Inbox
echo ""
echo -e "  \033[33mBrain Inbox:\033[0m"
PENDING=$(find "$FRAMEWORK_DIR/brain-inbox/pending-review" -maxdepth 1 -type f 2>/dev/null | wc -l)
APPROVED=$(find "$FRAMEWORK_DIR/brain-inbox/approved" -maxdepth 1 -type f 2>/dev/null | wc -l)
REJECTED=$(find "$FRAMEWORK_DIR/brain-inbox/rejected" -maxdepth 1 -type f 2>/dev/null | wc -l)

if [ "$PENDING" -gt 0 ]; then
    echo -e "    \033[33mPending Review: $PENDING\033[0m"
else
    echo -e "    \033[90mPending Review: 0\033[0m"
fi
echo -e "    \033[90mApproved:       $APPROVED\033[0m"
echo -e "    \033[90mRejected:       $REJECTED\033[0m"

# Projects
echo ""
echo -e "  \033[33mProjects (sibling folders):\033[0m"
PROJECTS_DIR="$(dirname "$FRAMEWORK_DIR")"
for sibling in "$PROJECTS_DIR"/*/; do
    NAME=$(basename "$sibling")
    if [ "$NAME" != "Ai-Agent-Framework" ] && [ -d "$sibling" ]; then
        if [ -f "$sibling/AI_CONTEXT.md" ]; then
            echo -e "    \033[32m[ Framework Project ] $NAME\033[0m"
        else
            echo -e "    \033[90m[ Other ] $NAME\033[0m"
        fi
    fi
done

echo ""
echo -e "\033[36m======================================\033[0m"
echo ""

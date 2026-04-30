# 🤖 Ai-Agent-Framework

> **A portable, IDE-agnostic framework for managing AI agent knowledge, memory, and project scaffolding.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Framework](https://img.shields.io/badge/Framework-v1.0.0-green.svg)](VERSION.md)
[![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Mac%20%7C%20Linux-blue.svg)](#scripts)

---

## 🌟 What is this?

**Ai-Agent-Framework** solves the biggest pain points of working with AI coding assistants:

| Problem | How this framework solves it |
|---------|-----|
| 🧠 **AI forgets everything** between sessions | `HANDOFF.md` — portable episodic memory that persists across IDE restarts |
| 🔄 **Switching IDEs** loses all context | **Hub & Spoke pattern** — 8 IDE configs all point to one `AI_CONTEXT.md` |
| 📋 **No standard project structure** for AI collaboration | **Project template** with pre-configured docs, skills, and guidelines |
| 🗂️ **Knowledge scattered** across projects | **Centralized knowledge base** with version control and review pipeline |
| 👤 **AI doesn't know your preferences** | **Owner profile + global rules** that carry across all projects |

### Supported IDEs & AI Assistants

| IDE / Tool | Config File |
|-----------|-------------|
| Cursor / Antigravity | `.cursorrules` |
| Claude Code | `CLAUDE.md` |
| OpenAI Codex | `AGENTS.md` |
| Gemini CLI | `GEMINI.md` |
| GitHub Copilot | `.github/copilot-instructions.md` |
| Windsurf | `.windsurfrules` |
| Cline | `.clinerules` |
| Amazon Q | `.amazonq/rules/project-context.md` |

---

## ⚡ Quick Start

### 1. Clone
```bash
git clone https://github.com/narut-jun/ai-agent-framework.git
cd ai-agent-framework
```

### 2. Create your first project
**Windows (PowerShell):**
```powershell
.\scripts\windows\create-project.ps1
```

**Mac / Linux (Bash):**
```bash
./scripts/mac-linux/create-project.sh
```
The script will ask for project name, path, and description — then copy the template and replace all placeholders automatically.

### 3. Open your new project in any IDE
The AI assistant will automatically read `AI_CONTEXT.md` and understand your project structure, guidelines, and preferences.

---

## 🏗️ Architecture

```
┌──────────────────────────────────────────────┐
│         Ai-Agent-Framework (Global Hub)       │
│                                              │
│  knowledge/    → rules, patterns, skills     │
│  brain-inbox/  → review pipeline             │
│  templates/    → project scaffolding         │
│  scripts/      → CLI tools                   │
│  guides/       → documentation (9 chapters)  │
└──────────┬──────────────────▲────────────────┘
           │ scaffold          │ knowledge flows up
           │ (one-time copy)   │ (milestone-based)
           ▼                   │
┌─────────────────────────┐    │
│   Your Project (Spoke)  │    │
│                         │    │
│  AI_CONTEXT.md (Hub)  ──┼──► IDE configs (8 files)
│  HANDOFF.md (Memory)    │    │
│  docs/ + skills/        │────┘
└─────────────────────────┘
```

### Key Design Decisions

- **Snapshot, not Pointer** — Each project gets a copy of knowledge. Global updates don't break production.
- **Sibling repos** — Projects are independent Git repos, never nested inside the framework.
- **Human-in-the-loop** — Knowledge extraction requires human review before entering global knowledge.
- **Dual versioning** — Framework version (structure) and Knowledge version (content) are tracked separately.
- **Free tier first** — Designed to work without paid services.

---

## 📁 Project Structure

```
ai-agent-framework/
├── README.md                 ← You are here
├── LICENSE                   ← MIT License
├── AI_CONTEXT.md             ← AI reads this first (for framework workspace)
├── COMMANDS.md               ← 9 AI commands for knowledge management
├── VERSION.md                ← Framework + Knowledge version tracking
├── CHANGELOG.md              ← Release notes
├── .gitignore
│
├── scripts/                  ← 🔧 CLI tools (PowerShell)
│   ├── create-project.ps1    ← Interactive project scaffolding
│   ├── show-status.ps1       ← System status dashboard
│   ├── config.example.json   ← Configuration template
│   └── README.md             ← Scripts documentation
│
├── guides/                   ← 📚 User guides (9 chapters, in Thai)
│   ├── 01_QUICK_START.md
│   ├── 02_CREATE_NEW_PROJECT.md
│   ├── ...
│   └── 09_TROUBLESHOOTING.md
│
├── knowledge/                ← ⭐ Swappable knowledge base
│   ├── global-rules/         ← Identity, policies, conventions
│   ├── patterns/             ← Architecture & design patterns
│   └── skills/               ← How-to guides & procedures
│
├── knowledge-empty/          ← Clean template for new users
│
├── brain-inbox/              ← Knowledge review pipeline
│   ├── REVIEW_QUEUE.md       ← Human review dashboard
│   ├── pending-review/
│   ├── approved/
│   └── rejected/
│
└── templates/
    ├── NEW_PROJECT_CHECKLIST.md
    └── project-template/     ← Full project scaffold (8 IDE configs included)
```

---

## 📚 Documentation

> Guides are written in **Thai (ภาษาไทย)**. We welcome PRs to add English translations.

| # | Topic | File |
|---|-------|------|
| 1 | Quick Start | [01_QUICK_START.md](guides/01_QUICK_START.md) |
| 2 | Create New Project | [02_CREATE_NEW_PROJECT.md](guides/02_CREATE_NEW_PROJECT.md) |
| 3 | AI Memory System | [03_AI_MEMORY_SYSTEM.md](guides/03_AI_MEMORY_SYSTEM.md) |
| 4 | Brain Intake | [04_BRAIN_INTAKE_GUIDE.md](guides/04_BRAIN_INTAKE_GUIDE.md) |
| 5 | Human Review | [05_HUMAN_REVIEW_GUIDE.md](guides/05_HUMAN_REVIEW_GUIDE.md) |
| 6 | Version Management | [06_VERSION_MANAGEMENT.md](guides/06_VERSION_MANAGEMENT.md) |
| 7 | IDE & Account Switching | [07_IDE_ACCOUNT_SWITCHING.md](guides/07_IDE_ACCOUNT_SWITCHING.md) |
| 8 | AI Commands Reference | [08_AI_COMMANDS_REFERENCE.md](guides/08_AI_COMMANDS_REFERENCE.md) |
| 9 | Troubleshooting | [09_TROUBLESHOOTING.md](guides/09_TROUBLESHOOTING.md) |

---

## 🔧 Scripts

> 🔄 **Cross-Platform**: Scripts are organized by operating system.

| Folder / Script | Description |
|-----------------|------------|
| `windows/create-project.ps1` | Interactive project creation for Windows |
| `windows/show-status.ps1` | System status dashboard for Windows |
| `mac-linux/create-project.sh` | Interactive project creation for Mac/Linux |
| `mac-linux/show-status.sh` | System status dashboard for Mac/Linux |

### Configuration

Scripts use `config.json` for settings (auto-created on first run).  
Supports: **Gemini** · **Claude** · **OpenAI** · **Ollama** (local, free)

```bash
cp scripts/config.example.json scripts/config.json
# Edit config.json with your settings
```

> 🔒 `config.json` is gitignored. Never commit API keys.

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

- 🌐 **Translate** guides to English
- 🐧 **Port** PowerShell scripts to bash/zsh
- 📝 **Improve** documentation
- 🐛 **Report** bugs via Issues
- 💡 **Suggest** new features

---

## 📜 License

[MIT License](LICENSE) © 2026 [Narut Rungruangbangchan](https://github.com/narut-jun) · narut.jun@gmail.com

---

## ⭐ Star this repo

If you find this framework useful, please give it a ⭐! It helps others discover it.

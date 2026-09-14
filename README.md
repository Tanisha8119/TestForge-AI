# TestForge-AI

Prototype repository for **TestForge AI**, a reusable VS Code / GitHub Copilot custom agent that turns natural-language testing scenarios into repository-specific unit tests and component tests.

## Repository contents

- `/TestForge-AI-Agent` - initial agent package structure for the hackathon prototype

## Prototype goals

TestForge AI is designed to:

- understand a developer or tester's plain-language test scenario
- inspect the **currently open workspace**
- detect the repository's existing testing framework and conventions
- identify whether unit tests, component tests, or both are appropriate
- generate focused test cases and test code without inventing unsupported behavior

## Current scope

This prototype intentionally focuses on local codebase analysis and test generation guidance only.

Not included yet:

- Azure DevOps or PBI integration
- external databases
- web UI
- authentication

See `TestForge-AI-Agent/README.md` for the full agent documentation and usage guidance.

# TestForge-AI

TestForge AI is a **reusable GitHub Copilot custom-agent scaffold** for repository-aware test generation.

It is general-purpose, but it is always grounded in the **currently open target repository/workspace**.

## What it is

This repository provides:

- a custom-agent definition (`TestForge-AI-Agent/.github/agents/testforge.agent.md`)
- operational instruction docs (`TestForge-AI-Agent/instructions/`)
- reusable test-guideline templates (`TestForge-AI-Agent/templates/`)
- repository-aware usage examples (`TestForge-AI-Agent/examples/`)

This is a scaffold/documentation package, not a full application.

## What problem it solves

When developers ask Copilot to generate tests from natural language, outputs are often generic and not aligned to the active codebase.

TestForge AI is designed to make test generation:

- repository-aware
- convention-aligned
- framework-consistent
- explicit about assumptions and blockers

## Core behavior

The agent should always:

- inspect the currently open repository/workspace first
- detect existing test frameworks, folder structure, naming, and mocking patterns
- detect whether the repository uses C# test classes, Gherkin/Reqnroll feature files, both, or another existing pattern
- choose unit tests, component tests, or both based on user request + repository evidence
- generate only code that fits local conventions
- avoid inventing APIs, files, helpers, or unsupported behavior

When relevant files already exist, it should prefer updating them. Only create new test files when no suitable existing file matches the feature grouping.

## Architecture / workflow

1. User provides a natural-language test scenario.
2. Agent inspects the current repository.
3. Agent finds existing tests and conventions.
4. Agent decides whether unit tests, component tests, or both are appropriate.
5. Agent decides whether to update existing tests or create new files based on repository organization.
6. Agent generates repository-aligned test output.

## How to use this in another repository

1. Use `TestForge-AI-Agent/.github/agents/testforge.agent.md` as the agent definition source.
2. Register it in your Copilot custom-agent environment (user-level or equivalent UI/workflow supported by your tooling).
3. Open the **target application repository** (the repo you want tests for).
4. Select **TestForge AI**.
5. Provide a natural-language scenario (feature behavior, success/failure cases, edge cases).
6. Review generated test output and assumptions/blockers.

Important: the TestForge repository is the scaffold only; it is **not** the application under test unless you explicitly open it as the target workspace.

## Currently supported

- Natural-language scenario analysis
- Repository/workspace inspection
- Existing framework/convention detection
- C# unit-test pattern detection (such as MSTest/xUnit/NUnit) when present
- Gherkin/Reqnroll feature-file pattern detection when present
- Unit/component test-type selection
- Repository-aligned test generation guidance/output
- Clear summary of findings, generated content, and assumptions
- Optional Azure Boards intake: read a work item's Title/Description/Acceptance
  Criteria as the scenario input (`scripts/fetch-azure-workitem.ps1`, read-only, PAT
  supplied via environment variable)
- Optional GitHub pull request creation for generated tests, only on explicit user
  request (`scripts/create-github-pr.ps1`, requires `git` + authenticated `gh` CLI)

## Expected output structure

Each agent response should explicitly summarize:

1. Scenario understanding
2. Related code/test files found
3. Chosen test type (unit, component, or both)
4. Chosen file strategy (update existing vs create new)
5. Generated test content
6. Assumptions or blockers

## Out of scope / not yet implemented

- Automatic commit/push/PR creation for Azure DevOps Repos (GitHub PR creation is
  supported; see `scripts/create-github-pr.ps1`)
- Writing back to Azure Boards (work-item intake is read-only)
- Authentication (the agent uses credentials/tokens the user already has; it does not
  manage logins or access control)
- External database storage
- Full web UI

## Concrete example workflow

**Scenario input**

"Generate tests for the login form. Success should call `onLoginSuccess`; API failure should show an error and re-enable submit."

**Repository-aware steps**

1. Agent locates the login component and existing login-related tests.
2. Agent detects existing component-test stack (for example: React Testing Library + Jest + local render helper).
3. Agent confirms naming/assertion/mocking style from nearby tests.
4. Agent selects component tests (and unit tests only if separate login logic module exists and is already unit-tested similarly).
5. Agent chooses file strategy (extend existing login test file if present; otherwise create a new correctly named test file).
6. Agent generates aligned test output:
   - submit success calls `onLoginSuccess`
   - API error shows message
   - submit button is re-enabled after failure

## Repository layout

```text
.
├── README.md
└── TestForge-AI-Agent/
	├── .github/agents/testforge.agent.md
	├── instructions/
	├── templates/
	├── examples/
	└── scripts/
```

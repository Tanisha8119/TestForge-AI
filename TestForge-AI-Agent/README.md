# TestForge AI

**TestForge AI** is a reusable custom agent definition for VS Code / GitHub Copilot that helps developers and testers generate unit tests and component tests from a natural-language testing scenario.

## What problem it solves

Writing high-quality tests often requires a developer to:

- translate a plain-language requirement into concrete test cases
- find the relevant code in an unfamiliar repository
- determine which testing tools are already in use
- follow existing test conventions instead of introducing new ones
- avoid guessing about missing behavior or APIs

TestForge AI is intended to automate that workflow while staying grounded in the **current workspace** the user has open.

## How the agent works

TestForge AI follows a repository-aware workflow:

1. Understand the user's testing scenario
2. Inspect the current workspace for implementation code, tests, and test configuration
3. Identify the repository's existing testing technology and conventions
4. Decide whether unit tests, component tests, or both are appropriate
5. Derive focused test scenarios from the real implementation
6. Generate or update test files in the working tree only
7. Validate imports, syntax, and framework alignment
8. Summarize what was understood, found, generated, and any limitations

## Expected input

The agent expects a natural-language request such as:

- "Generate unit tests for the price formatting helper when the currency is missing."
- "Create component tests for the login form success and error states."
- "Add both unit and component tests for the location permission flow."

Optional user guidance may include:

- preferred test type (unit, component, or both)
- specific files or folders to inspect first
- specific behavior, edge cases, or regressions to cover

## Expected output

When enough repository context exists, TestForge AI should produce:

- a concise interpretation of the scenario
- the relevant implementation and test files it found
- the test type selected
- the concrete scenarios it plans to cover
- generated or updated test files using the repository's existing framework
- the result of any test command that was actually executed
- any assumptions, blockers, or missing information

## Supported prototype scope

This hackathon prototype supports:

- natural-language scenario analysis
- current-workspace codebase inspection
- unit-test and component-test planning
- reuse of existing testing frameworks and patterns
- focused test generation in the working tree
- concise result explanation for developer review

## Limitations

This prototype does **not** currently include:

- Azure DevOps integration
- PBI/work-item lookup
- external database storage
- a web application or dashboard
- authentication or multi-user access control
- automatic commit, push, or pull request creation

It also should not:

- assume the TestForge AI repository is the application being tested
- read an entire repository when targeted inspection is enough
- invent missing functions, APIs, files, or behavior
- modify production code unless testability truly requires it and the user confirms

## Using the custom agent from another repository

TestForge AI is intended to be used as a **user-level custom agent** in VS Code / GitHub Copilot.

### Prototype usage model

This repository should currently be treated as a **design/reference scaffold** for a user-level custom agent rather than a guaranteed plug-and-play package.

- The intended agent definition lives at `TestForge-AI-Agent/.github/agents/testforge.agent.md` from the repository root.
- `.github` is a hidden directory, so some file-tree views may hide it by default.
- The `instructions/`, `templates/`, and `examples/` folders are companion reference material for maintainers and future refinement; they are not auto-loaded by the runtime unless a future integration adds that behavior.
- In an environment that supports registering user-level custom agents from markdown definitions, the expected usage flow is:
  1. make the `testforge.agent.md` definition available to the user-level custom-agent feature
  2. open the target application repository in VS Code
  3. select **TestForge AI**
  4. provide the testing scenario in natural language

> Exact registration steps depend on the Copilot custom-agent feature available in your environment. If that capability is not available yet, use this repository as the source definition and documentation set for future enablement.
>
> Background reading only: if you want related documentation for markdown-based Copilot customization, see GitHub Docs for [Adding repository custom instructions for GitHub Copilot in your IDE](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions-in-your-ide/add-repository-instructions-in-your-ide) and the VS Code docs on [using an `AGENTS.md` file](https://code.visualstudio.com/docs/copilot/customization/custom-instructions#_use-an-agentsmd-file). Those links are not the registration path for this prototype's `testforge.agent.md` file.

When the agent is selected while another application repository is open:

- the **open workspace** becomes the codebase to inspect
- the agent should search that repository for implementation files, tests, and test configuration
- generated tests should follow that repository's framework, naming, structure, and mocking patterns
- changes should remain in that repository's working tree for developer review

In other words, the agent definition is reusable; it does **not** assume the current repository is the system under test.

## Project structure

The following tree shows the **repository-root layout** for this prototype:

```text
.
├── README.md
└── TestForge-AI-Agent/
    ├── .github/
    │   └── agents/
    │       └── testforge.agent.md
    ├── instructions/
    │   ├── requirement-analysis.md
    │   ├── codebase-analysis.md
    │   ├── test-strategy.md
    │   └── test-generation.md
    ├── templates/
    │   ├── unit-test-guidelines.md
    │   └── component-test-guidelines.md
    └── examples/
        └── example-scenarios.md
```

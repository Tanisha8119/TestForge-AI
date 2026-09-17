# Test Generation Guidance

Use this guide when writing or updating test files in the current workspace.

## Rules for generating tests

- Base every test on real implementation details from the repository.
- Reuse the existing test framework and local conventions.
- Prefer small, focused tests over large multi-purpose tests.
- Match local file naming, imports, setup style, and mocking approach.
- Create a new test file only when no appropriate existing file is available.
- Add to an existing relevant test file when that keeps the change focused.

## Repository-alignment checklist

Before generating content, mirror the local conventions for:

- file placement (`tests/`, `__tests__/`, `src/.../*.spec.*`, etc.)
- naming (suite names and test names)
- assertion style and matcher vocabulary
- mocking/stubbing approach
- setup/teardown and fixture utilities

Also align with repository test asset style:

- C# unit-test class pattern (`.cs`, attributes, class/method naming)
- Gherkin/Reqnroll pattern (`.feature`, scenario phrasing, tag style)

Do not introduce new frameworks, helpers, or stylistic patterns when repository patterns already exist.

## File update vs create policy

- Prefer extending an existing relevant test file when it already groups the same feature/component.
- Create a new test file only when no suitable existing file exists.
- Place new files in the same folder structure pattern used by nearby tests.
- Name new files using the local naming convention.

## Before writing code

Confirm:

- the target function, component, or class exists
- the dependency/test framework is already present
- similar tests exist or configuration is sufficient to infer the pattern
- you understand expected success, failure, and edge behavior

## While writing code

- import only real modules
- mock only real collaborators
- use assertions consistent with the repository's style
- keep test names descriptive and behavior-focused
- avoid changing production code unless the user approves a clearly necessary testability change

For `.feature` output, do not invent step definitions or unsupported step phrases; reuse phrasing patterns that map to existing step-definition style where evident.

When possible, keep each test to one behavioral claim with minimal setup.

## After writing code

Validate:

- imports resolve correctly
- syntax is valid
- test names match the covered behavior
- mocks align with the implementation
- test commands, if run, target the affected area when possible

Also confirm:

- generated tests do not reference nonexistent exports or files
- assertions are tied to behavior visible in implementation
- redundant or duplicate cases are removed
- generated file type matches repository evidence (`.cs`, `.feature`, or existing pattern)

## If information is missing

Do not guess. Explain what is missing, such as:

- the relevant implementation file
- the repository's testing framework
- a reliable way to identify the correct module or component
- the need for a production-code seam to make testing possible

State missing context in a precise, actionable way (for example: "No existing component tests or render helper found for this feature folder").

## Output packaging template

Provide results in this order:

1. Scenario understanding
2. Repository evidence used
3. Selected test type
4. Selected file strategy (update existing vs create new)
5. Coverage list
6. Generated/updated test files
7. Assumptions or blockers

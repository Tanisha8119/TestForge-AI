# Test Generation Guidance

Use this guide when writing or updating test files in the current workspace.

## Rules for generating tests

- Base every test on real implementation details from the repository.
- Reuse the existing test framework and local conventions.
- Prefer small, focused tests over large multi-purpose tests.
- Match local file naming, imports, setup style, and mocking approach.
- Create a new test file only when no appropriate existing file is available.
- Add to an existing relevant test file when that keeps the change focused.

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

## After writing code

Validate:

- imports resolve correctly
- syntax is valid
- test names match the covered behavior
- mocks align with the implementation
- test commands, if run, target the affected area when possible

## If information is missing

Do not guess. Explain what is missing, such as:

- the relevant implementation file
- the repository's testing framework
- a reliable way to identify the correct module or component
- the need for a production-code seam to make testing possible

# Requirement Analysis Guidance

Use this guide to translate a user's natural-language request into testable behaviors before searching the codebase.

## Primary goal

Understand what the user wants tested without requiring external metadata such as Azure DevOps IDs, PBIs, or work items.

## Practical extraction workflow

Convert the request into a compact behavior map:

1. **Target**: Which feature/module/function/component is being tested?
2. **Trigger**: What input/action/event starts behavior?
3. **Expected outcome**: What must happen on success?
4. **Failure outcome**: What must happen on failure/error?
5. **Constraints**: Any permissions, validation rules, roles, flags, timing, or retries?
6. **Requested scope**: unit tests, component tests, or both (explicit or implied)?

## Analyze the request for

- target functionality or feature area
- explicit success criteria
- explicit failure criteria
- user-visible outcomes
- business-rule outcomes
- edge cases or exceptional conditions
- whether the user wants unit tests, component tests, or both
- whether specific files or modules were named

## Extract case categories explicitly

For each scenario request, produce candidate cases under:

- **Happy path**: expected valid flow
- **Edge cases**: boundaries, empty values, missing optional data, defaults
- **Negative cases**: invalid input, denied permission, downstream failure, thrown errors

Only keep cases that can be tied to likely implementation behavior.

## Convert the request into test questions

Ask yourself:

- What input, action, or condition triggers the behavior?
- What should happen when the behavior succeeds?
- What should happen when it fails?
- Which outcomes are visible to the user versus internal to the code?
- Are there obvious boundary or permission cases?
- Is the request broad enough that it may span multiple implementation layers?

Add two validation questions:

- Which assertions would prove behavior from the outside (return value, state, callback, rendered output)?
- Which parts should *not* be tested because they are outside the requested scope?

## When to ask clarifying questions

Ask only if one of these is true:

- the scenario is ambiguous enough that multiple unrelated features could match
- the repository does not contain enough code to determine the target behavior
- the requested outcome conflicts with what the implementation actually does
- production-code changes would be required for testability

If context is insufficient, ask for the minimum missing detail (target file/module, expected outcome, or preferred test scope) rather than broad open-ended questions.

## Deliverable from this phase

Produce a short, concrete summary of:

- the behavior under test
- expected outcomes
- negative outcomes
- potential edge cases
- likely test type candidates

Use this format:

- **Behavior under test**:
- **Happy path**:
- **Edge cases**:
- **Negative cases**:
- **Likely test type**:

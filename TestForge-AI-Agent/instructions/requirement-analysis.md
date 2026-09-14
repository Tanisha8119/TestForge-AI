# Requirement Analysis Guidance

Use this guide to translate a user's natural-language request into testable behaviors before searching the codebase.

## Primary goal

Understand what the user wants tested without requiring external metadata such as Azure DevOps IDs, PBIs, or work items.

## Analyze the request for

- target functionality or feature area
- explicit success criteria
- explicit failure criteria
- user-visible outcomes
- business-rule outcomes
- edge cases or exceptional conditions
- whether the user wants unit tests, component tests, or both
- whether specific files or modules were named

## Convert the request into test questions

Ask yourself:

- What input, action, or condition triggers the behavior?
- What should happen when the behavior succeeds?
- What should happen when it fails?
- Which outcomes are visible to the user versus internal to the code?
- Are there obvious boundary or permission cases?
- Is the request broad enough that it may span multiple implementation layers?

## When to ask clarifying questions

Ask only if one of these is true:

- the scenario is ambiguous enough that multiple unrelated features could match
- the repository does not contain enough code to determine the target behavior
- the requested outcome conflicts with what the implementation actually does
- production-code changes would be required for testability

## Deliverable from this phase

Produce a short, concrete summary of:

- the behavior under test
- expected outcomes
- negative outcomes
- potential edge cases
- likely test type candidates

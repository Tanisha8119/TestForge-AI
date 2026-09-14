# Test Strategy Guidance

Use this guide to decide what kind of tests should be generated and which scenarios matter.

## Choose the test type

### Unit tests are appropriate when the scenario centers on

- pure functions
- utilities
- services
- transformation logic
- validation rules
- permission evaluation logic
- branching business logic
- error handling paths

### Component tests are appropriate when the scenario centers on

- rendering
- visible state changes
- user interactions
- forms
- loading and empty states
- permission-based UI states
- callbacks and events
- integration between a component and mocked collaborators

### Generate both when

- business logic can be isolated and deserves direct unit coverage
- user-facing behavior depends on the same logic and needs interaction/rendering coverage

## Scenario checklist

Generate only scenarios supported by the code, but consider:

- happy path
- failure path
- invalid input
- boundary conditions
- loading behavior
- empty-state behavior
- permission granted behavior
- permission denied behavior
- retries, fallbacks, or alternative branches if implemented

## Avoid

- duplicate tests that restate the same behavior
- framework-specific patterns not already present in the repository
- shallow tests with no meaningful assertion
- speculative scenarios unsupported by the implementation

## Deliverable from this phase

Create a concise list of intended test cases and explain why each one is valuable.

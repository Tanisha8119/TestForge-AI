# Test Strategy Guidance

Use this guide to decide what kind of tests should be generated and which scenarios matter.

## Choose the test type

Base the choice on both:

- user intent in the prompt
- repository evidence from existing tests and architecture

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

### Decision heuristics

- If the repository only contains one relevant test layer in that feature area, prefer that layer.
- If component behavior is requested but no component-test tooling exists, explain the gap and provide unit coverage for testable logic where possible.
- If unit logic is embedded inside UI-only code and repository convention tests this through component tests, follow that convention.
- Do not force "both" unless code and conventions support both.

For C#/Gherkin mixed repositories:

- Prefer `.cs` unit tests when behavior is logic-centric and existing evidence shows unit-test classes for similar logic.
- Prefer `.feature` component/behavior tests when behavior is already captured as scenarios in existing feature files.
- Use both only when the repository already uses both patterns for the same or closely related feature area.

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

Prioritize coverage that maps to explicit branches in implementation rather than theoretical branches.

## Avoid

- duplicate tests that restate the same behavior
- framework-specific patterns not already present in the repository
- shallow tests with no meaningful assertion
- speculative scenarios unsupported by the implementation

## Coverage planning template

For each planned test, define:

- **Case name**
- **Type** (unit/component)
- **Given** (state/input)
- **When** (action/event)
- **Then** (assertion)
- **Evidence** (file/function/branch that supports the case)

## File strategy decision template

Before generation, decide:

- **Existing relevant test file(s)**: list candidate files
- **Decision**: update existing or create new
- **Reason**: feature grouping, naming convention, and repository organization evidence

Default preference: update existing relevant files when they clearly match the feature under test.

## Deliverable from this phase

Create a concise list of intended test cases and explain why each one is valuable.

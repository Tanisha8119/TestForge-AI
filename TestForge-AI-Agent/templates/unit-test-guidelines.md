# Unit Test Guidelines

Use these conventions when the repository's scenario calls for unit-level coverage.

## Focus areas

- business rules
- pure logic
- utility functions
- service behavior
- branching paths
- error handling
- boundary conditions

## Repository-aware defaults

- reuse existing naming conventions from nearby unit tests
- preserve existing assertion style and matcher usage
- preserve existing mocking/stubbing and fixture patterns
- keep output focused: include only tests required by requested behavior and supported branches
- for .NET repositories, preserve existing C# test class conventions (attributes, class/method naming, namespace placement)

## Good unit-test characteristics

- tests one behavior at a time
- uses minimal setup
- isolates collaborators through the repository's existing mocking approach
- asserts observable outcomes rather than implementation noise
- covers both expected and negative outcomes where meaningful

## Typical unit-test scenario categories

- returns the expected value for valid input
- handles missing or invalid input correctly
- applies permission or feature-flag rules correctly
- propagates or handles errors as designed
- preserves behavior at important boundaries

## Authoring reminders

- prefer the repository's existing file naming pattern
- follow existing `describe` / `it` / `test` structure if present
- match current assertion style and matcher usage
- avoid duplicate tests that cover the same branch
- if a feature-specific unit test file already exists, extend it before creating a new file

## Minimal output template

- **Suite name**: follows local naming style
- **Cases**:
  - happy path
  - one or more edge/negative paths supported by implementation
- **Assertions**: behavior-focused, not implementation-detail-focused

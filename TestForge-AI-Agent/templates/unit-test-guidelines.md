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

# Example Scenarios

These examples illustrate the kinds of requests TestForge AI should handle while adapting to the **current workspace** and its existing testing tools.

## 1. Unit-test request example (repository-aware)

**User request**

> Generate unit tests for the `formatPrice` utility. It should return a formatted currency string for valid input, default to USD when the currency code is missing, and throw an error when the amount is not numeric.

**Repository context to look for**

- utility implementation file (for example `src/utils/formatPrice.ts`)
- existing utility tests (`src/utils/__tests__/*.test.ts` or similar)
- framework signal in config/dependencies (for example Jest/Vitest)
- assertion and naming style in nearby tests

**Expected agent behavior**

- locate the `formatPrice` implementation
- find existing utility test patterns
- confirm the unit-test framework already used in the repository
- generate focused tests for valid input, missing currency, and invalid amount

**Expected output shape**

1. Scenario understanding
2. Files/patterns found (implementation + existing test style)
3. Chosen type: unit tests
4. Planned coverage (happy + edge + negative)
5. Generated test content aligned with local conventions
6. Assumptions/blockers (if any)

## 2. Component-test request example (repository-aware)

**User request**

> Create component tests for the login form. When the user submits valid credentials, the success callback should run. When the API returns an error, the error message should be displayed and the submit button should be re-enabled.

**Repository context to look for**

- login component and submit handler
- existing component tests in the same feature area
- render helper/wrapper utilities
- mocking style for API or auth service
- if repository uses BDD, existing `.feature` files and related step-definition patterns

**Expected agent behavior**

- locate the login form component and its collaborators
- identify the repository's component-test utilities and mocking style
- create tests for submit success, error display, and button-state recovery

**Expected output shape**

1. Scenario understanding
2. Files/patterns found
3. Chosen type: component tests
4. Planned coverage (submit success, error state, re-enable behavior)
5. Generated test content aligned with repository conventions
6. Assumptions/blockers

## 3. Request requiring both unit and component tests

**User request**

> Generate both unit and component tests for the location permission feature. The permission helper should return `allowed` when permission is granted and `blocked` when denied. The map entry component should enable access when permission is granted and show the restricted state when permission is denied.

**Repository context to look for**

- permission helper/service implementation
- map entry component and permission usage path
- existing unit-test and component-test patterns
- whether both layers already exist in the repository

## 4. C# MSTest + Reqnroll mixed repository example

**User request**

> Add tests for order cancellation. Validate service-level cancellation rules and the customer-facing cancellation flow.

**Repository context to look for**

- existing C# unit test project using MSTest attributes (`[TestClass]`, `[TestMethod]`)
- existing `.feature` files for customer-facing behavior
- existing step-definition conventions and scenario wording style
- whether an order cancellation test class or feature file already exists

**Expected agent behavior**

- choose unit tests for service rule validation in `.cs` tests
- choose `.feature` scenarios for customer flow only if repository already uses Reqnroll/Gherkin for that area
- prefer updating existing order-related test class/feature file if present
- create new files only when no suitable existing file is available
- avoid inventing unsupported step phrases, helpers, or APIs

**Expected output shape**

1. Scenario understanding
2. Related code/test files found
3. Chosen test type (unit/component/both) with evidence
4. Chosen file strategy (update existing vs create new)
5. Generated test content (`.cs`, `.feature`, or both as supported)
6. Assumptions/blockers

**Expected agent behavior**

- find the permission helper logic and the UI component that uses it
- reuse the repository's existing unit-test and component-test frameworks
- generate direct unit coverage for permission evaluation
- generate component coverage for granted and denied user-visible states

**Expected output shape**

1. Scenario understanding
2. Files/patterns found for both layers
3. Chosen type: both (with justification)
4. Planned coverage split by unit vs component
5. Generated test content per layer
6. Assumptions/blockers (for example if component tooling is absent)

# Example Scenarios

These examples illustrate the kinds of requests TestForge AI should handle while adapting to the **current workspace** and its existing testing tools.

## 1. Simple unit-test scenario

**User request**

> Generate unit tests for the `formatPrice` utility. It should return a formatted currency string for valid input, default to USD when the currency code is missing, and throw an error when the amount is not numeric.

**Expected agent behavior**

- locate the `formatPrice` implementation
- find existing utility test patterns
- confirm the unit-test framework already used in the repository
- generate focused tests for valid input, missing currency, and invalid amount

## 2. Component-test scenario

**User request**

> Create component tests for the login form. When the user submits valid credentials, the success callback should run. When the API returns an error, the error message should be displayed and the submit button should be re-enabled.

**Expected agent behavior**

- locate the login form component and its collaborators
- identify the repository's component-test utilities and mocking style
- create tests for submit success, error display, and button-state recovery

## 3. Scenario requiring both unit and component tests

**User request**

> Generate both unit and component tests for the location permission feature. The permission helper should return `allowed` when permission is granted and `blocked` when denied. The map entry component should enable access when permission is granted and show the restricted state when permission is denied.

**Expected agent behavior**

- find the permission helper logic and the UI component that uses it
- reuse the repository's existing unit-test and component-test frameworks
- generate direct unit coverage for permission evaluation
- generate component coverage for granted and denied user-visible states

# Component Test Guidelines

Use these conventions when the requested behavior is best validated through component-level tests.

## Focus areas

- rendering
- visible text and states
- user interactions
- events and callbacks
- success and failure flows
- loading, empty, and disabled states
- permission-driven UI behavior

## Repository-aware defaults

- reuse existing test file placement and naming conventions
- preserve current render helper/wrapper usage
- preserve existing assertion style and matcher patterns
- preserve local mocking/fixture patterns for services, API clients, and hooks
- keep output minimal and scenario-focused
- if repository evidence uses Gherkin/Reqnroll for behavior tests, preserve `.feature` style and folder/naming conventions

## Good component-test characteristics

- interacts with the component the way a user would
- asserts visible outcomes and externally observable behavior
- uses the repository's standard render helpers and utilities
- mocks network/services only when consistent with local practice
- keeps each test focused on one scenario

## Typical component-test scenario categories

- renders default state correctly
- responds to user input or clicks
- shows loading feedback while work is pending
- shows success state when the action succeeds
- shows error state when the action fails
- blocks or hides behavior when permission is denied
- enables the intended feature when permission is granted

## Authoring reminders

- prefer existing test utilities already used in the repository
- reuse local wrapper/setup patterns
- assert meaningful UI behavior rather than internal implementation details
- avoid generating component tests for logic that is better covered by unit tests alone

Generate component-test BDD-style output only if the repository already uses that style or the user explicitly requests it.

If existing feature files cover the same module/feature, prefer extending those files instead of creating a new one.

## Minimal output template

- **Suite name**: aligned with local style
- **Cases**:
  - render/default state
  - interaction/result state
  - failure/recovery or permission state when applicable
- **Assertions**: user-visible outcomes and callback effects

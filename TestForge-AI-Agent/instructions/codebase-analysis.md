# Codebase Analysis Guidance

Use this guide to inspect the **current workspace** efficiently before generating tests.

## Objective

Find the smallest useful set of files needed to understand the requested behavior and the repository's testing conventions.

## Mandatory repository-first rule

- Always inspect the currently open repository/workspace first.
- Never assume this TestForge repository is the application under test.

## Search priorities

Start with keywords derived from the user's scenario, then look for:

- implementation files related to the feature
- existing tests for neighboring functionality
- test setup/configuration files
- dependency manifests such as `package.json`, `pom.xml`, `build.gradle`, `requirements.txt`, or similar
- framework-specific configuration for test runners, mocks, and setup hooks

## Practical detection checklist

Use evidence from file names, imports, and config files to identify existing tooling.

Examples:

- JavaScript/TypeScript: `package.json`, `jest.config.*`, `vitest.config.*`, `playwright.config.*`, `cypress.config.*`
- Python: `pyproject.toml`, `pytest.ini`, `conftest.py`
- Java/Kotlin: `pom.xml`, `build.gradle*`, `src/test/*`
- .NET: `*.csproj`, test projects, `xunit`, `nunit`, `mstest` package references

For C#/BDD repositories, also check for:

- C# test classes (`[TestClass]`, `[TestMethod]`, `[Fact]`, `[Theory]`, `[Test]`)
- Gherkin/Reqnroll assets (`*.feature`, Reqnroll/SpecFlow-related package references, step-definition folders/classes)

Look for assertion/mocking signals in test files (for example: `expect`, `assert`, `should`, Mockito, sinon, test doubles, local helpers).

## What to inspect

- components
- services
- hooks
- controllers
- classes
- functions
- utilities
- existing test directories and naming patterns

## What to infer from the repository

- programming language and framework
- test runner in use
- assertion library
- mocking strategy
- file naming conventions
- test folder structure
- whether component tests, unit tests, or both already exist
- whether feature coverage is implemented through C# tests, `.feature` files, or both

## How to infer local test style

Sample nearby existing tests and capture:

- naming pattern (`*.test.*`, `*.spec.*`, folder placement)
- structure (`describe/it`, `test`, class-based tests)
- fixture/setup style (`beforeEach`, shared builders, factory helpers)
- mocking pattern (module mocks, spies, stubs, dependency injection)
- assertion style and common matchers

For `.feature` style repositories, capture:

- Feature/Scenario naming pattern
- Given/When/Then phrasing style
- tag usage (if present)
- folder placement by feature/module

For C# test style repositories, capture:

- namespace and class naming conventions
- test method naming pattern
- Arrange/Act/Assert usage style
- assertion library style (MSTest assertions, FluentAssertions, etc.)

Prefer consistency with the closest neighboring tests over global assumptions.

## Efficiency rules

- Do not scan the entire repository without a reason.
- Prefer targeted searches over bulk reading.
- Prioritize files directly connected to the requested behavior.
- Use nearby existing tests as the primary style reference.

Stop searching once you have enough evidence to generate aligned tests. Do not over-scan.

## Deliverable from this phase

Identify:

- relevant implementation files
- relevant existing tests
- test configuration files
- the likely test framework and conventions to follow
- likely file strategy candidates (update existing test file vs create new file)

Use this format:

- **Implementation targets found**:
- **Existing tests/patterns found**:
- **Detected framework + mocking + assertion style**:
- **Detected test asset types**: C# classes / `.feature` files / both / other
- **Likely file strategy**: update existing / create new (with reason)
- **Confidence**: high / medium / low

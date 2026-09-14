# Codebase Analysis Guidance

Use this guide to inspect the **current workspace** efficiently before generating tests.

## Objective

Find the smallest useful set of files needed to understand the requested behavior and the repository's testing conventions.

## Search priorities

Start with keywords derived from the user's scenario, then look for:

- implementation files related to the feature
- existing tests for neighboring functionality
- test setup/configuration files
- dependency manifests such as `package.json`, `pom.xml`, `build.gradle`, `requirements.txt`, or similar
- framework-specific configuration for test runners, mocks, and setup hooks

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

## Efficiency rules

- Do not scan the entire repository without a reason.
- Prefer targeted searches over bulk reading.
- Prioritize files directly connected to the requested behavior.
- Use nearby existing tests as the primary style reference.

## Deliverable from this phase

Identify:

- relevant implementation files
- relevant existing tests
- test configuration files
- the likely test framework and conventions to follow

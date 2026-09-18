# Pull Request Creation (Optional, Explicit Approval Required)

Use this guide only after tests have already been generated/validated in the working
tree and the user explicitly asks to open a pull request.

## Preconditions

- Test generation (and any user-approved execution/validation) is already complete.
- The user has explicitly asked to commit, push, and/or open a PR. Never do this as a
  default continuation of test generation.
- `git` and an authenticated GitHub CLI (`gh`) are available in the target repository.

## Workflow

1. Summarize exactly which files will be committed and confirm with the user.
2. Run `TestForge-AI-Agent/scripts/create-github-pr.ps1` with:
   - `-CommitMessage` describing the generated tests
   - `-Title` / `-Body` summarizing scenario, coverage, and test type
   - `-Branch` (optional; a timestamped branch is created if omitted)
   - `-Base` set to the repository's actual default branch if it is not `main`
   - `-Draft` if the user wants a draft PR
3. Report the resulting branch name and PR URL back to the user.

## What this does NOT do

- It does not run without explicit, per-request user approval — approval for one PR
  does not imply approval for future ones.
- It does not push directly to the base branch; it always creates a new branch.
- It does not modify production code as part of this step; only files already produced
  by the test-generation workflow should be committed.
- It does not support Azure DevOps Repos PRs in this prototype (GitHub PRs only).

## Failure handling

If the script fails (no changes, push rejected, `gh` not authenticated, etc.), surface
the exact error and ask the user how to proceed. Never force-push or bypass branch
protection to work around a failure.

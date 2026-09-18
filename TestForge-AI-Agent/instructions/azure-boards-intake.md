# Azure Boards Intake (Optional)

Use this guide when a user wants a testing scenario sourced from an Azure DevOps
work item (PBI, User Story, Bug, Task) instead of typing the scenario by hand.

## When this applies

- The user references a work item ID, PBI number, or says "use Azure Boards".
- The user has already set up access (`AZURE_DEVOPS_PAT` environment variable) and
  provides organization/project/work-item ID.

If the user does not mention Azure Boards, do not ask for one — natural-language
scenarios remain the default and primary input path.

## Workflow

1. Confirm the user has `AZURE_DEVOPS_PAT` set with "Work Items (Read)" scope, and the
   organization, project, and work item ID.
2. Run `TestForge-AI-Agent/scripts/fetch-azure-workitem.ps1` with those parameters.
3. Treat the returned Title/Description/Acceptance Criteria as the natural-language
   scenario input to the normal requirement-analysis workflow
   (see `instructions/requirement-analysis.md`) — no different from a manually typed
   request.
4. Proceed with the standard TestForge AI workflow: codebase inspection, test-type
   selection, generation, and validation.
5. In the final summary, cite the work item ID/URL as the scenario source.

## What this does NOT do

- It does not write status, comments, or links back to Azure Boards.
- It does not require Azure DevOps for any request that already has a natural-language
  scenario — this is strictly an alternate intake source.
- It does not authenticate the user; it only reads a work item using a PAT the user
  already possesses and supplies via environment variable.

## Failure handling

If the fetch fails (missing PAT, invalid ID, network/permission error), report the
exact error from the script and ask the user to correct the input or fall back to a
manually typed scenario. Never fabricate work item content.

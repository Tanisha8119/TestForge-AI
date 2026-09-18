<#
.SYNOPSIS
    Fetches a work item (e.g. PBI, User Story, Bug) from Azure Boards and prints it as a
    natural-language testing scenario that can be handed to TestForge AI.

.DESCRIPTION
    Calls the Azure DevOps REST API for a single work item and extracts Title,
    Description, Acceptance Criteria, State, and Tags. Requires a Personal Access
    Token (PAT) with at least "Work Items (Read)" scope.

    The PAT is never accepted as a plain parameter to avoid it leaking into shell
    history/process listings. Set it in an environment variable first:

        $env:AZURE_DEVOPS_PAT = "<your-pat>"

.PARAMETER Organization
    Azure DevOps organization name, e.g. "contoso" (from https://dev.azure.com/contoso).

.PARAMETER Project
    Azure DevOps project name.

.PARAMETER WorkItemId
    Numeric work item ID to fetch.

.PARAMETER PatEnvVar
    Name of the environment variable holding the PAT. Defaults to AZURE_DEVOPS_PAT.

.PARAMETER OutFile
    Optional path to also save the extracted scenario as a .md file for the agent to read.

.EXAMPLE
    $env:AZURE_DEVOPS_PAT = "xxxxx"
    .\fetch-azure-workitem.ps1 -Organization contoso -Project MyApp -WorkItemId 12345

.EXAMPLE
    .\fetch-azure-workitem.ps1 -Organization contoso -Project MyApp -WorkItemId 12345 -OutFile scenario.md
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Organization,

    [Parameter(Mandatory = $true)]
    [string]$Project,

    [Parameter(Mandatory = $true)]
    [int]$WorkItemId,

    [string]$PatEnvVar = "AZURE_DEVOPS_PAT",

    [string]$OutFile,

    [string]$ApiVersion = "7.1"
)

$ErrorActionPreference = "Stop"

$pat = [System.Environment]::GetEnvironmentVariable($PatEnvVar)
if ([string]::IsNullOrWhiteSpace($pat)) {
    throw "No PAT found in environment variable '$PatEnvVar'. Set it first, e.g. `$env:$PatEnvVar = '<token>'"
}

$base64Pat = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))
$headers = @{ Authorization = "Basic $base64Pat" }

$uri = "https://dev.azure.com/$Organization/$Project/_apis/wit/workitems/$WorkItemId`?`$expand=all&api-version=$ApiVersion"

try {
    $workItem = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
}
catch {
    throw "Failed to fetch work item $WorkItemId from $Organization/$Project. $_"
}

function Strip-Html {
    param([string]$Html)
    if ([string]::IsNullOrWhiteSpace($Html)) { return "" }
    $text = $Html -replace '<br\s*/?>', "`n" -replace '</p>', "`n" -replace '<[^>]+>', ''
    $text = [System.Net.WebUtility]::HtmlDecode($text)
    return $text.Trim()
}

$fields = $workItem.fields
$title = $fields.'System.Title'
$type = $fields.'System.WorkItemType'
$state = $fields.'System.State'
$description = Strip-Html $fields.'System.Description'
$acceptanceCriteria = Strip-Html $fields.'Microsoft.VSTS.Common.AcceptanceCriteria'
$tags = $fields.'System.Tags'

$scenario = @"
# Azure Boards Work Item #$WorkItemId ($type, $state)

**Title:** $title

## Description
$description

## Acceptance Criteria
$acceptanceCriteria

## Tags
$tags

## Source
https://dev.azure.com/$Organization/$Project/_workitems/edit/$WorkItemId
"@

Write-Output $scenario

if ($OutFile) {
    Set-Content -Path $OutFile -Value $scenario -Encoding UTF8
    Write-Verbose "Scenario saved to $OutFile"
}

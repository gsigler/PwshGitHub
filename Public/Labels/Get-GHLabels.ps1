function Get-GHLabels {
    <#
    .SYNOPSIS
        Get labels for a repository 

    .DESCRIPTION
        Get labels for a repository 

    .EXAMPLE

    #>
    [CmdletBinding()]
    param(
        # The owner of the repository 
        [parameter(Mandatory = $True)]
        [string]$Owner,

         # The Repository to get labels for 
         [parameter(Mandatory = $True)]
         [string]$Repository
    )
    Process
    {
        Write-Output (Invoke-GitHubRepositoryRequest -Owner $Owner -Repository $Repository -Resource "labels")
    }  
}
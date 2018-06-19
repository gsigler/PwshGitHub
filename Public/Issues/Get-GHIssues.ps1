function Get-GHIssues {
    <#
    .SYNOPSIS
        Get issues for a repository 

    .DESCRIPTION
        Get issues for a repository 

    .EXAMPLE

    #>
    [CmdletBinding()]
    param(
        # The owner of the repository 
        [parameter(Mandatory = $True)]
        [string]$Owner,

        # The Repository to get labels for 
        [parameter(Mandatory = $True)]
        [string]$Repository, 

        # Indicates which sorts of issues to return.
        [ValidateSet("assigned", "created", "mentioned", "subscribed", "all")]
        [string]$Filter, 

        # Indicates the state of the issues to return.
        [ValidateSet("open", "closed", "all")]
        [string]$State, 

         # A list of comma separated label names.
         [string[]]$Label, 

         # Only issues updated at or after this time are returned. 
         [datetime]$Since

    )
    Process
    {
        $params = @{}
        if ($Filter) {
            $params.Add('filter', $Filter)
        }
        if ($State) {
            $params.Add('state', $State)
        }
        if ($Label) {
            $params.Add('labels', $Label -join ",")
        }
        if ($Since) {
            $params.Add('since', $Since)
        }
    
        Write-Output (Invoke-GitHubRepositoryRequest -Owner $Owner -Repository $Repository -Resource "issues" -Params $params)
    }  
}
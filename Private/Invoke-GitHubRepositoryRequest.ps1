function Invoke-GitHubRepositoryRequest {
    param(
        # The owner for the repository
        [parameter(Mandatory = $True)]
        [string]
        $Owner, 
       
        # The repository to be accessed
        [parameter(Mandatory = $True)]
        [string]
        $Repository,
       
        # The resource url to be accessed
        [parameter(Mandatory = $True)]
        [string]
        $Resource,

        [hashtable]
        $Params,

        [hashtable]
        $Body
    )
   
    $headers = @{
        Authorization = "Bearer $env:GitHubToken"
        Accept = "application/vnd.github.symmetra-preview+json"
        "User-Agent" = "PwshGithub" 
    }
    if ($Params -eq $null -and $Body -eq $null) {
        $response = Invoke-RestMethod -Method GET -Headers $headers -Uri https://api.github.com/repos/$Owner/$Repository/$Resource 
        return $response
    } elseif ($Params -ne $null) {
        $response = Invoke-RestMethod -Method GET -Headers $headers -Body $Params -Uri https://api.github.com/repos/$Owner/$Repository/$Resource 
        return $response
    } elseif ($Body -ne $null) {
        $response = Invoke-RestMethod -Method GET -Headers $headers -Body ($Params | ConvertTo-Json) -Uri https://api.github.com/repos/$Owner/$Repository/$Resource 
        return $response
    }
     
}
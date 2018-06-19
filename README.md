Emoji Accept Header 
    application/vnd.github.symmetra-preview+json

User-Agent 
    PwshGitHub

Issues ------

Get-GHIssues
   GET /repos/:owner/:repo/issues
   +(owner, repo)
   -(milestone, state, assignee, creator, mentioned, labels, sort, direction, since)

Get-GHIssue
    GET /repos/:owner/:repo/issues/:number
    +(owner*, repo*, number*)

New-GHIssue
    POST /repos/:owner/:repo/issues
     +(owner, repo, title)
     -(body, labels, assignees, milestone)

Edit-GHIssue
    PATCH /repos/:owner/:repo/issues/:number
    +(owner*, repo*, number*)
    -(body, labels, assignees, milestone)


Assignees ----- 
Get-GHAssignees
    GET /repos/:owner/:repo/assignees
    +(owner*, repo*)

Get-GHMilestones
    GET /repos/:owner/:repo/milestones
    +(owner, repo)
    -(state, sort, direction)

New-GHMilestone
    POST /repos/:owner/:repo/milestones
    +(owner, repo, title)
    -(title, state, description, due_on)

Edit-GHMilestone 
    PATCH /repos/:owner/:repo/milestones/:number
     +(owner, repo, number)
    -(title, state, description, due_on)

Remove-GHMilestone
    DELETE /repos/:owner/:repo/milestones/:number
     +(owner, repo, number)

Labels -----
- Get-GHLabels
    GET /repos/:owner/:repo/labels
    +(owner, repo)

Get-GHLabel
    GET /repos/:owner/:repo/labels/:name
    +(owner, repo, name)

New-GHLabel
    POST /repos/:owner/:repo/labels
    +(owner, repo, name, color)
    -(description)

Edit-GHLabel
    PATCH /repos/:owner/:repo/labels/:current_name
    +(owner, repo)
    -(name, color, description)

Remove-GHLabel
    DELETE /repos/:owner/:repo/labels/:name
    +(owner, repo, name)


Issue Labels -----

Get-GHIssueLabels
    GET /repos/:owner/:repo/issues/:number/labels
    +(owner, repo, number)

Add-GHIssueLabel
    POST /repos/:owner/:repo/issues/:number/labels
    +(owner, repo, number, listOfLabelNames)

Remove-GHIssueLabel
    DELETE /repos/:owner/:repo/issues/:number/labels/:name
    +(owner, repo, number, lableName)


Issue Comments -- 
Get-GHIssueComments
    GET /repos/:owner/:repo/issues/:number/comments
    +(owner, repo, number)
    - (since)

New-GHIssueComment
    POST /repos/:owner/:repo/issues/:number/comments
    +(owner, repo, number,body)


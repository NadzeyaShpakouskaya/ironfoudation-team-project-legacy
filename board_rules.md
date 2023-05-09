# Board rules 

The description of the team workflow for the board.

## Description

The board consists of 5 columns:

- `Common backlog`- includes all tasks that should be done.
- `Sprint backlog` - includes the list of tasks for the current sprint.
- `In Progress` - the list of tasks that the team works on.
- `In Review` - the list of tasks that are under review process.
- `Done` - the list of tasks that were successfully finished. If a task contains code, it should be merged into the main branch. In the case, when a task is useless or can not be closed for some reason it should be closed in the next mode "Close as not planned" (won't fix, can't repro, duplicate, stale, etc.).

### Common backlog

The process of the issue creating and adding to Common backlog.
Every issue is placed in a common backlog when it is created.
The issue should contain a clear title and description with definitions of done (**DoD**).
Select necessary labels, if applicable. For example, if you add a task to create documentation, put the label "Documentation" (label's description is provided below). 
Don't forget to link the project Repository.

### Sprint backlog

Before sprint planning the issues place into Sprint backlog by PM.
During the sprint planning process, the issues from the sprint backlog are estimated (labels with estimation are assigned).

**Estimation** is carried out with the participation of all team members online using the **Scrum Poker** technology on the resource [planningpokeronline](https://planningpokeronline.com).

Except estimation labels in project also provided labels: 

- `Invalid`- this doesn't seem right.
- `Documentation` - improvements or additions to documentation.
- `Need more discussion`- further information is requested.
- `Bug`- something isn't working.
- `Blocker` - urgent level of priority, it's blocking another task.
- `Blocked` - this task cannot be done until the task on which it depends is completed. (Inside the blocked issue is placed a link to the blocker).

All types of labels are marked with separate color.

**Important**: 

* the fields milestone, and labels with estimation points should be filled for the issues after Sprint planning.

### In Progress

When the work on the task starts it moves to in Progress section and stays there until PR will be opened.

**Important**: the field assignee should be strictly added `In Progress` section. 

### In Review

When the task code is under review, it is located in Progress column.
When the work on the task is done, the PR is opened and waited for the review process, the PR is placed in the in Review section. There are only open PRs in the `In Review` column.
Don't forget to link the opened PR with the issue. For doing that, please, fill the "Development section" when describing the issue and choose menu item "Link a branch or pull request" -> select the a repository and PR.
**Important**: if the PR is approved, then the PR creator can independently resolve conversations. 

### Done

`Done` - the list of tasks that successfully finished. If a task contains code, it should be merged to the main branch. In the case, when a task is useless or can not be closed for some resons it should be closed in the next mode "Close as not planned" (won't fix, can't repro, duplicate, stale etc.).

## Usage

The issue moves from left to right and can't skip any step (board section). The exception is when the team decides that the task cannot be completed or it needs to be canceled (read the description of **Done** section).
The main flow is:
 `
Common backlog -> Sprint backlog -> In progress -> In review -> Done.
`

## Important:

### Creating a new branch:
1) all branches should be created from the main branch;
2) name of a new branch should show the issue type(feature, bug fix), issue number, and branch name and follow this pattern  [type_of_task - #issue_from_backlog - title]. 
For example: **feature-1-create-project.**

### Merge restrictions to the main branch:
- minimum two approvals;
- all conversations should be closed (resolved) after exhaustive discussion.

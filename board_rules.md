# Board rules 

The description of the team workflow for the board.

## Description

The board consists of 5 columns:

- `Common backlog`- includes all tasks that should be done.
- `Sprint backlog` - includes the list of tasks for the current sprint.
- `In Progress` - the list of tasks that the team works on.
- `In Review` - the list of tasks that are under review process.
- `Done` - the list of tasks that are considered as completed. If a task is no longer makes sense, then it must be closed with an appropriate comment after agreement with the team.

### Usage

The issue moves from left to right and can't skip any step (board section). The exception is when the team decides that the task cannot be completed or it needs to be canceled (read the description of **Done** section).
The main flow is:
 `
Common backlog -> Sprint backlog -> In progress -> In review -> Done.
`

### Common backlog

Every issue is placed in a common backlog when it is created.
The issue must contain a clear title and description with definition of done (**DoD**).
Select necessary labels, if applicable. For example, if you add a task to create documentation, put the label "Documentation" ([label's description](https://github.com/ios-course/ironfoudation-team-project/labels)). 
Don't forget to choose corresponding project in the `Projects` section on pages, describing PR's and issue's contain.

### Sprint backlog

Before sprint planning the issues place into Sprint backlog by PO.
A milestone should be put to the issue at the moment of moving it into the Sprint backlog.
During the sprint planning process, the issues from the sprint backlog are estimated (labels with estimation are assigned).

**Estimation** is carried out with the participation of all team members online using the **Scrum Poker** technology on the resource [planningpokeronline](https://planningpokeronline.com).

Except estimation labels in project also provided [labels](https://github.com/ios-course/ironfoudation-team-project/labels). 

**Important**: 

* the fields milestone, and labels with estimation points should be filled for the issues after Sprint planning.

### In Progress

When a team member start working on the task, they must move it into the `In Progress` section. Issue stays there until PR will be opened. If issue doesn't require PR to be completed after agreement with the team its successful completion it will be moved into the `Done` section.

**Important**: the field assignee should be immediately filled when the task'll be moved `In Progress` section.

### In Review

When the task code is under review, it is located in `In Progress` column.
When the work on the task is done, the PR is opened and waited for the review process, the PR is placed in the in Review section. There are only open PRs in the `In Review` column.
Don't forget to link the opened PR with the issue. For doing that, please, fill the "Development section" when describing the issue and choose menu item "Link a branch or pull request" -> select the a repository and PR.
**Important**: if the PR is approved, then the PR creator can independently resolve conversations. 

### Done

An issue implying PR can be moved from the `In Review` section to the `Done` section after successful completion. If the issue does not require the creation of a PR, it can be closed by skipping the `In Review` section and moving directly from the `In Progress` section to the `Done` section in the case of its successful completion and after team's approve.

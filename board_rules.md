# Board rules 

The description of the team workflow for the board.

## Description

The board consists of 5 columns:

**Common backlog** - includes all tasks that should be done.
**Sprint backlog** - includes the list of tasks for the current sprint.
**In Progress** - the list of tasks that the team works on.
**In Review** - the list of tasks that are under review process.
**Done** - the list of tasks that successfully merged to main branch.

### Common backlog

The process of the issue creating and adding to Common backlog.
Every issue is placed in a common backlog when it is created.
The issue should contain a clear title and description with definitions of done (**DoD**).
Select necessary labels, if applicable.
Don't forget to link the project Repository.

### Sprint backlog

Before sprint planning the issues place into Sprint backlog by PM.
During the sprint planning process, the issues from the sprint backlog are estimated (labels with estimation are assigned), and the assignee is defined.

**Estimation** is carried out with the participation of all team members online using the **Scrum Poker** technology on the resource [planningpokeronline](https://planningpokeronline.com).

Except estimation labels in progect also provided labels: 
`high`, `medium`, `bug`, `blocker`, `enhancement`, `help wanted`:

`High` - high level of priority.
`Invalid`- this doesn't seem right.
`Documentation` - improvements or additions to documentation.
`Medium` - medium level of priority.
`Enhancement`- new feature or request.
`Need more discussion`- further information is requested.
`Bug`- something isn't working.
`Help wanted` - extra attention is needed.
`Low` - low level of priority.
`Invalid' - this doesn't seem right.
`Blocker` - urgent level of priority, it's blocking another task.

All types of labels are marked with separate color.

**Important**: the field assignee should be strictly added In Progress section. The fields milestone, and labels with estimation points should be filled for the issues after Sprint planning.

### In Progress

When the work on the task starts it moves to in Progress section and stays there until PR will be opened.

### In Review

When the work on the task is done, the PR is opened and waited for the review process, the issue is placed in the in Review section.
Don't forget to link the opened PR with the issue.

### Done

The issues have successfully gone through the review process and merged into main branch can be moved to the Done section.

## Usage

The issue moves from left to right and can't skip any step (board section).
The main flow is:
 `
Common backlog -> Sprint backlog -> In progress -> In review -> Done.
`

## Ironfoundation-team

You can contact the authors by the following email adresses:

```
Nadia Shpakouskaya: @NadzeyaShpakouskaya 
Alex Zavadskiy: @iBYarchitect
Julya Kmita: @julyakmita
```
## Important:

### Creating a new branch:
1) all branches should be created from the main branch;
2) name of a new branch should show the issue type, issue number and branch name:
 
 ```
 [type_of_task - #issue_from_backlog - title].
 For example:
 feature-1-create-project.
 ```

### Merge restrictions to the main branch:
- minimum two approvals;
- all conversations should be closed (resolve) after exhaustive discussion.

## Note
The team has daily stand ups at ten o'clock (GTM+3).

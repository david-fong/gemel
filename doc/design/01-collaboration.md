# Tighten Integration of Collaborative Tooling

I aim to solve the following problems:

- Basic tooling for core parts of programming as a community is all separated into different platforms: Our code review is separate from our core VCS, our changelog aggregation is also separate from the core VCS. These things that many people need to do could be much easier to do if they were considered core parts of VCS. Instead, we create a bunch of separate tools.

- Monster VCS diffs.
  - Solution: Make commits AST-based instead of text-based, and design to encourage making commits every time a change is made that compiles and behaves as desired (perhaps indicated by passing tests). To aid understanding necessarily-large commits, make each commit replayable as a series of smaller documentable changes so that the commit author can guide reviewers through it.

## VCS

- Linear mainline only?
- Centralized repo?
  - What common workflows use multiple remotes?
    - GitHub forking :O. Perhaps forking can be replaced by encouraging fine-grained modularity and dependency of libraries.
- Design a mechanism for migrating serialized data between schemas.
- Provide ability to summarize and view summaries of api changes.
- Encourage extremely small commits and pushing often.
- Provide easy mechanism to check for conflicts between branches.
- Encourage branch owners to

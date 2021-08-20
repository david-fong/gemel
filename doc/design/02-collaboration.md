# Tighten Integration of Collaborative Tooling

| Perceived Problem | Solution |
|:------------------|:---------|
| Separation of VCS from collaboration platforms / communication channels.<br>Code review, backlog and task tracking, and changelogs are each separate from the core VCS. The lack of deeper integration is an ergonomics bottleneck. | Unify all the things. |
| Commit diffs can be overwhelming and hard to follow. There is often a natural order / chain of dependency of breakage and resolution that just get bombarded at reviewers in the order of file paths. | Instead of git-like snapshot commits, make each commit replayable like watching a speedpaint with commentary / like viewing an "undo history" in reverse. |

## VCS

- Linear mainline only?
- Centralized repo?
  - What common workflows use multiple remotes?
    - GitHub forking :O. Perhaps forking (for the purpose of diverging into a different design approach) can be replaced by encouraging fine-grained modularity and dependency of libraries (ie. instead of forking, you could just depend on whichever parts of the original you can reuse (not sure if this would work out in practice)).
- Encourage extremely small commits and pushing often.
- Provide easy mechanism to check for conflicts between branches.

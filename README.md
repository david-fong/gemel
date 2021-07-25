# Structure Editor

This is a for-fun project to realize the tooling for a fantasy programming experience that I wish I could have for my day to day work based on structural programming. I have determined to try to build a [structure editor](https://en.wikipedia.org/wiki/Structure_editor), strongly-typed programming language, and version-control system. I'm making it web-based since that's what I'm currently most comfortable with.

It is not a current goal to make the programming language runtime (because I don't know how), and I don't even know what kind of runtime I want to target.

My goal is not to make something super decoupled and highly adaptable to existing languages and editors. I'm going to mash all the things I want to do together even though everything I know about good design say that's a terrible idea. I'm going to make a lot of mistakes and poor decisions, and what will likely happen is that I will create something that is much worse than what we commonly use today, but I'll try my best to improve and learn from it.

Of course, there are other projects that exist that already have very similar goals: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects). I won't go into the analysis of the possible benefits and disadvantages of structural editors here, since it's easy to find that stuff online.

## Things to Decide

- Do I want to support something like live code sharing where multiple people edit the same VCS branch together?

## Motivating Big Problems and High Level Solutions

- Indentation, formatting style, and casing (ambitious) wars.
  - Solution: Make these into configuration details on a per-developer basis. Use a normalized serialization format.

- Monster VCS diffs.
  - Solution: Make commits AST-based instead of text-based, and design to encourage making commits every time a change is made that compiles and behaves as desired (perhaps indicated by passing tests). To aid understanding necessarily-large commits, make each commit replayable as a series of smaller documentable changes so that the commit author can guide reviewers through it.

- Functions taking lots of parameters and the language not having named parameters.
  - Solution: Enforce named parameters by making function only able to take one parameter. Remove the burden of typing object field names by presenting object shapes as arrays with named indices (ie. the IDE will show the field names, but the dev doesn't have to type them out. Some IDEs have features like this, but it doesn't mix well with spacing being part of the serialization format). This also has the side effect that it mandates following the declaration order of fields in an interface, which I like (even though it requires serialized representations of an object to be updated if the declaration order is rearranged).

- Friction experienced by dependents in keeping up with dependency API changes and the resulting normalcy of maintaining long-term backwards compatibility, which itself is also quite difficult to do. This is reflected in the widespread adoption of semantic versioning and the surrounding dependency management tooling interfaces.
  - Solution. Each commit that changes api details should provide a mechanism to automatically migrate dependent code and data. Make an experience for dependents that actively prompts them to upgrade or at least regularly notifies them of available updates.

## Requirements (Features) and Chosen Restrictions (Non-Features)

Requirement: The serialization format _should not_ be interacted with as text. It should be designed to be easily deserializable.

### Hide Serialization and Improve IDE Interface

- Separate indentation and newlines from the serialization structure and instead make it a clientside configuration detail.

- Remove the choice of how declarations should be ordered. Make the editor try to do what it thinks is best for the user.

- Remove the burden of choosing when to separate namespaces/modules declared in the same file into separate files. Provide something like shell `cd`.

- Remove the choice of how to arrange the hierarchy for applications with multiple "dimensions" (Ex. web project with front and back ends and areas and multiple frontend concerns (HTML,CSS,JS)).
  - Provide ability to communicate multiple dimensions of hierarchies.
  - Provide ability to change viewing order of dimensions.

### Reading Code

- Make it easy to filter out information.
  - Show only declarations (hide definitions).
  - Show declarations and documentation.
  - Show only public declarations
    - Show private declarations used by the declaration under the currently selected declaration.

### Editing Code

- Give really good autocomplete without needing fancy AI things.
  - Design the language grammar for disambiguation. Reduce need for forward lookahead.
    - Use prefix notation for operators.
      - For subtraction and division, choose one of the following:
        - just make unary operators for negation and reciprocation.
        - make operators `+-` and `*-` that represent "un-adding" and "un-multiplying".
        -

-

### Programming Language Choices

#### Choosing Public-Friendly Terminology

- Choose terminology and notations that are familiar to the general public. Do this even at the cost of being unfamiliar or annoying to the general programming population.

| Use     | Instead Of         |
|:-------:|--------------------|
| folder  | namespace / module |
| verb    | function           |
| subject | this               |
| data    | object / struct    |

### Provide Grammar and Analysis Tooling for Declaration Dependency Control

### VCS

- Linear history only.
- Design a mechanism for migrating serialized data between schemas.
- Provide ability to summarize and view summaries of api changes.
- Encourage extremely small commits and pushing often.
- Provide easy mechanism to check for conflicts between branches.

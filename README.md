# 🌳 Gemel

This is a challenge to myself to prototype my own _speculative fiction_- to realize proof-of-concept tooling for a programming experience with the following qualities centred on improving human interfaces:

- It builds the human-to-tool and tool-to-tool interfaces closer to the AST layer of abstraction rather than to text files.
- It is designed to remove friction from the collaborative programming experience by unifying developer tooling / making the tools more aware of each other.
  - It is okay with the trade-off of adding some friction to non-collaborative projects and to scripting.
- It designed to be more approachable to the general public by avoiding OOP jargon and by taking browsers seriously as a frontend editor technology.
  - Note: Emphasis on _OOP_ "jargon". This does _not_ include standardized terminology such as the names of unrelated protocols or encoding schemes.

I will try to build a [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation). I realize that our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and that any mechanism created to allow them to do so will probably require adding complexity. My hope is that I can create an experience compelling enough that people would be _interested_ in somehow moving toward such a direction and adopting some of its ideas in the future.

## Things to Get Out of the Way

- It is not a current goal to make the programming language runnable (because I don't yet know how), and I haven't decided on whether to make it garbage collected or not, although I'm leaning toward a non-garbage-collected language.

- I realize that much of programming relies on domain-specific languages such as HTML and CSS, which will probably never change from being stored as text. I don't really know what to do about that, since I'm trying to move away from interacting with text files.

- Of course, there are other projects that exist that already have very similar goals: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects), but these are generally interface-level changes that don't go as deep as changing the serialization format.

- There are great existing technologies powering IDEs today such as the Language Server Protocol and Tree-Sitter, but those are also designed for text files being the human interface. I'm pretty sure they're of no direct use to this project.

## Motivating Big Problems and High Level Solutions

- Indentation, formatting style, and casing convention wars.
  - Solution: Make these into configuration details on the developer's side. Use a normalized serialization format.

- Spelling.
  - People having different preferences on brevity of terminology (ex "element" vs "elem" vs "el", or "event" vs "ev").
  - British and American spellings of words.
  - People who don't speak English needing to learn english in order to participate in open-source projects or use libraries.
  - Solution: What if our human-readable identifiers were represented as compositions of words, and we could have dictionaries of different spellings of those words? This starts building the foundation for things like standard dictionaries and automatic human-language translation.
    - I don't think this is a sufficient solution to the non-english-speaker problem, since it doesn't solve anything when it comes to communication between people who speak different languages such as during code review... And submitting a PR in non-english that introduces new words might have some difficulty... But I don't want to discard this idea before anybody gets to try it... Or perhaps we could just rely on browser functionality to provide automatic translation?...

- Monster VCS diffs.
  - Solution: Make commits AST-based instead of text-based, and design to encourage making commits every time a change is made that compiles and behaves as desired (perhaps indicated by passing tests). To aid understanding necessarily-large commits, make each commit replayable as a series of smaller documentable changes so that the commit author can guide reviewers through it.

- Basic tooling for core parts of programming as a community is all separated into different platforms: Our code review is separate from our core VCS, our changelog aggregation is also separate from the core VCS. These things that many people need to do could be much easier to do if they were considered core parts of VCS. Instead, we create a bunch of separate tools.

- Functions taking lots of parameters and the language not having named parameters.
  - Solution: Enforce named parameters by making function only able to take one parameter. Remove the burden of typing object field names by presenting object shapes as arrays with named indices (ie. the IDE will show the field names, but the dev doesn't have to type them out. Some IDEs have features like this, but it doesn't mix well with spacing being part of the serialization format). This also has the side effect that it mandates following the declaration order of fields in an interface, which I like (even though it requires serialized representations of an object to be updated if the declaration order is rearranged).

- Existing languages and IDEs not making it easy to trace or filter information like where exceptions might come from, where functions get called, etc.

- Friction experienced by dependents in keeping up with dependency API changes and the resulting normalcy of maintaining long-term backwards compatibility, which itself is also quite difficult to do. This is reflected in the widespread adoption of semantic versioning and the surrounding dependency management tooling interfaces.
  - Solution. Each commit that changes api details should provide a script to automatically migrate dependent code and data. Make an experience for dependents that actively prompts them to upgrade or at least regularly notifies them of available updates.

## Requirements (Features) and Chosen Restrictions (Non-Features)

Requirement: The serialization format _should not_ be interacted with as text. It should be designed to be easily deserializable.

### Hide Serialization and Improve IDE Interface

- Separate indentation and line-breaks from the serialization structure and instead make it a clientside configuration detail.

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
      - For subtraction and division (symmetric operations), choose one of the following:
        - just make unary operators for negation and reciprocation.
        - make operators `un+` and `un*` that represent "un-adding" and "un-multiplying".
        -
      - Either require explicit delimiters/terminator for operators with unknown arity, or only require it when the dev wants to use the operator with more than the minimum arity.
        -

-

### Programming Language Choices

#### Choosing Public-Friendly Terminology

- Choose terminology and notations that are familiar to the general public / any person with basic english and computer literacy. Do this even at the cost of being unfamiliar or annoying to the general programming or mathematics population.

| Instead Of                   | Use             | Why |
|------------------------------|:---------------:|-----|
| namespace / module / package | folder          | The only word we use that I think carries its meaning is "namespace", which is not a commonly used word. |
| comment                      | explainer       | "Comment" does not imply usefulness. "Passing comment" is a common phrase meaning a cheap personal remark not necessarily well thought out. That's totally contrary to what our "comments" are supposed to do. "Explainer" may even have the power of the common wisdom that the obvious doesn't need to explained, which is a common misuse of software "comments". |
| field / member variable      | part            | |
| method / function            | action          | |
| commit                       | update          | |
| pull-request                 | update proposal | |
| array reduce                 | summarize       | |

#### Miscellaneous

- Place comments and documentation after declaration signatures, but before code blocks. The rationale is that I often find the signatures to be self-documenting, or good enough to get a general idea of what the thing is. When the documentation goes first, you don't even get a good chance to see what's being documented.

#### Inheritance

Use delegation like Kotlin and automatically prompt for and display disambiguation information when inherited members have similar signatures.

### Provide Grammar and Analysis Tooling for Declaration Dependency Control

### VCS

- Linear history only.
- Centralized repo?
  - What common workflows use multiple remotes?
- Design a mechanism for migrating serialized data between schemas.
- Provide ability to summarize and view summaries of api changes.
- Encourage extremely small commits and pushing often.
- Provide easy mechanism to check for conflicts between branches.
- Encourage branch owners to

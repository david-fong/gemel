# 🌳 Gemel

This is a challenge to myself to prototype my speculative fiction-y thoughts- to realize proof-of-concept tooling for a programming experience with the following qualities centred on improving human interfaces:

- It designed to be more approachable to the general public by avoiding what I think is arbitrary programmer jargon, and by taking browsers seriously as a sustainable platform for synchronously collaborative frontends.

- It builds the human-to-tool and tool-to-tool interfaces closer to the AST layer of abstraction rather than to text files.

- It is designed to remove friction from the collaborative programming experience by tightening integration of various developer tooling.
  - It is okay with the trade-off of adding some friction to non-collaborative projects and to scripting.

I will try to build a collaborative real-time [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed, general-purpose OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation). I realize that our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and that any mechanism created to allow them to do so will probably require adding significant complexity. My hope is that I can create an experience compelling enough that people would at least be interested in somehow moving toward such a direction and adopting some of its ideas in the future.

## Things to Get Out of the Way

Feel free to skip reading this unless you have itching concerns; I might address those here.

- It is not a current goal to make the programming language runnable (because I don't yet know how), and I haven't decided on whether to make it garbage collected or not, although I'm leaning toward a non-garbage-collected language. My focus of exploration here is developer experience- not program performance. Any work I do with respect to performance will just be for my own enjoyment and learning.
  - If I ever get to this point, I want to allow for running native code, so I'll then look into something that isn't limited by the regular browser sandbox- probably Electron.

- I come from a web-development background, with a bit of for-fun programming in C++. I no formal education or experience in many many things and it will probably show. Any reaching out to me to open my mind to things I may not have considered is very much appreciated if done kindly and with some patience.

- I realize that much of programming relies on domain-specific languages such as HTML and CSS, which will probably never change from being stored as text. I don't really know what to do about that, since I'm trying to move away from interacting with text files.

- Of course, there are other projects that exist that already have very similar goals: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects), but these are generally interface-level changes that don't go as deep as changing the serialization format.

- There are great existing technologies powering IDEs today such as the Language Server Protocol and Tree-Sitter, but those are also designed for text files being the human interface. I'm pretty sure they're of no direct use to this project.

- I am not trying to create "_the_" next programming language, or IDE, or VCS. Far from it. I am trying to inspire a specific set of directions for change. I cannot possibly provide every great facility that our existing tooling is capable of- nor am I trying to. I am only one small person.

## Elaboration of Goals

See [the dedicated readme](doc/design/terminology.md).

### Build Interfaces on the AST Layer

Tradeoff: Do not care about whether the serialized of the code is readable. Actively discourage devs from directly interacting with the serialized form.

This allow for solving the following problems:

- Indentation, formatting style, and casing convention wars.
  - Solution: Make these into configuration details on the developer's side. Use a normalized serialization format.

- Spelling. (This is a _maybe_ goal).
  - People having different preferences on brevity of terminology (ex "element" vs "elem" vs "el", or "event" vs "ev").
  - British and American spellings of words.
  - People who don't speak English needing to learn english in order to participate in open-source projects or use libraries.
  - Solution: What if our human-readable identifiers were represented as compositions of words, and we could have dictionaries of different spellings of those words? This starts building the foundation for things like standard dictionaries and automatic human-language translation.

- Functions taking lots of parameters and the language not having named parameters.
  - Solution: Enforce named parameters by making function only able to take one parameter. Remove the burden of typing object field names by presenting object shapes as arrays with named indices (ie. the IDE will show the field names, but the dev doesn't have to type them out. Some IDEs have features like this, but it doesn't mix well with spacing being part of the serialization format). This also has the side effect that it mandates following the declaration order of fields in an interface, which I like (even though it requires serialized representations of an object to be updated if the declaration order is rearranged).

- Friction experienced by dependents in keeping up with dependency API changes and the resulting normalcy of maintaining long-term backwards compatibility, which itself is also quite difficult to do. This is reflected in the widespread adoption of semantic versioning and the surrounding dependency management tooling interfaces.
  - Solution. Each commit that changes api details should provide a script to automatically migrate dependent code and data. Make an experience for dependents that actively prompts them to upgrade or at least regularly notifies them of available updates.

### Tighten Integration of Collaboration Tooling

I aim to solve the following problems:

- Basic tooling for core parts of programming as a community is all separated into different platforms: Our code review is separate from our core VCS, our changelog aggregation is also separate from the core VCS. These things that many people need to do could be much easier to do if they were considered core parts of VCS. Instead, we create a bunch of separate tools.

- Monster VCS diffs.
  - Solution: Make commits AST-based instead of text-based, and design to encourage making commits every time a change is made that compiles and behaves as desired (perhaps indicated by passing tests). To aid understanding necessarily-large commits, make each commit replayable as a series of smaller documentable changes so that the commit author can guide reviewers through it.

## Miscellaneous Non-Dramatic Decisions

Here are some things that I will do that our existing technologies could also probably easily do (not all of them are expressly "improvements". some are just regular old choices):

### Hide Serialization and Improve IDE Interface

- Remove the choice of how to arrange the hierarchy for applications with multiple "dimensions" (Ex. web project with front and back ends and areas and multiple frontend concerns (HTML,CSS,JS)).
  - Provide ability to communicate multiple dimensions of hierarchies.
  - Provide ability to change viewing order of dimensions.

### Reading Code

- Make named return values. It's annoying to have to read the doc comment just to figure out what a return value of a method means. I believe that good names are often sufficiently good documentation. The name doesn't even have to have any ability to shorten caller code (although there's possibility that it could help to do that). This might be less helpful for generic collection types, but it will probably be much better than nothing.

- Make it easy to filter out information.
  - Show only declarations (hide definitions).
  - Show declarations and documentation.
  - Show only public declarations
    - Show private declarations used by the declaration under the currently selected declaration.

- Make it easy to trace or filter information like where exceptions might come from, where functions get called, etc.

- Make it easy to see which method calls perform mutations. Perhaps by coloring or emboldening or something like that.

### Editing Code

- Give really good autocomplete without needing fancy AI things.
  - Design the language grammar for disambiguation. Reduce need for forward lookahead.
    - Prefix keywords with colons in statement contexts where user-defined identifiers could also go.
    - Use prefix notation for operators.
      - For subtraction and division (symmetric operations), choose one of the following:
        - just make unary operators for negation and reciprocation.
        - make operators `un+` and `un*` that represent "un-adding" and "un-multiplying".
      - Either require explicit delimiters/terminator for operators with unknown arity, or only require it when the dev wants to use the operator with more than the minimum arity.
        -

-

### Programming Language Choices

#### Miscellaneous

- Place comments and documentation after declaration signatures, but before code blocks. The rationale for declarations is that I often find the signatures to be self-documenting, or good enough to get a general idea of what the thing is. When the documentation goes first, you don't even get a good chance to see what's being documented. I think Python's got it right.

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

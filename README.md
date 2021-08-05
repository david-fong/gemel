# 🌳 Gemel

This is a challenge to myself to prototype my speculative fiction-y thoughts- to realize proof-of-concept tooling for a programming experience with the following qualities centred on improving human interfaces:

- It is designed to remove friction from the collaborative programming experience by tightening integration of various developer tooling, and supporting collaborative, real-time editing.

- It builds the human-to-tool and tool-to-tool interfaces closer to the AST layer of abstraction rather than to text files.

- The language is designed to be more approachable to the general public by avoiding what I think is arbitrary programmer jargon.

I will try to build a collaborative, real-time [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed, general-purpose OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. I'm ready to invest a minimum of three years of my free time into this project, and then I'll step back and re-evaluate what I want to do with it. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation). I realize that our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and that any mechanism created to allow them to do so will probably require adding significant complexity. My hope is that I can create an experience compelling enough that people would at least be interested in somehow moving toward such a direction and adopting some of its ideas in the future.

Compatibility with any existing languages, editors, VCS, or collaborative platforms is _not_ a goal.

Since I want to support natively compiling and running, I will probably use [tauri](https://github.com/tauri-apps/tauri) and the LLVM. This my first time using them, so I'll inevitably do some rookie nonos. Any correction and guidance will be appreciated. My initial motivation though was to focus mostly on the front end of things. For the web frontend, I'm going to try to go without a framework in order to avoid their limitations (I'll use one if I find a reason that compels me to).

Sidenote: Here are some cool editors and libraries for text-file-based editing: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects), the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/), and [Tree-Sitter](https://tree-sitter.github.io/tree-sitter/).

## Elaboration of Goals

### Avoid "Arbitrary Jargon"

See [the dedicated readme](doc/design/terminology.md).

### Build Interfaces on the AST Layer

See [the dedicated readme](doc/design/ast.md).

### Tighten Integration of Collaborative Tooling

See [the dedicated readme](doc/design/collaboration.md).

## Miscellaneous Non-Dramatic Decisions

See [the dedicated readme](doc/design/non-dramatic.md).

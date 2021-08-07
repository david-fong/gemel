# 🌳 Gemel

This is a challenge to myself to prototype my speculative fiction-y thoughts- to realize proof-of-concept tooling for a programming experience with the following qualities centred on improving human interfaces:

- It is designed to remove friction from the collaborative programming experience by tightening integration of various developer tooling, and supporting collaborative, real-time editing.
  - See [the dedicated readme](doc/design/collaboration.md).

- It builds the human-to-tool and tool-to-tool interfaces closer to the AST layer of abstraction rather than to text files.
  - See [the dedicated readme](doc/design/ast.md).

- The language is designed to be more approachable to the general public by avoiding what I think is arbitrary programmer jargon.
  - See [the dedicated readme](doc/design/terminology.md).

- SIt has some other miscellaneous (and less dramatic) features / design goals.
  - See [the dedicated readme](doc/design/non-dramatic.md).

I will try to build a collaborative, real-time [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed, general-purpose OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation). I'm going to work on this until at least the year 2024.

I realize that our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and that any mechanism created to allow them to do so will probably require adding significant complexity. But I want to break free!- so it is _not_ a goal to provide any compatibility with any existing languages, editors, VCS, or collaborative platforms. My hope is that I can create an experience compelling enough that people would at least be interested in somehow moving toward such a direction and adopting some of its ideas as we slowly write and (even more slowly) embrace a better future.

For information about the project architecture, see [the dedicated readme](doc/design/architecture.md).

Sidenote: Here are some cool editors and libraries for text-file-based editing: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects), the [Language Server Protocol](https://microsoft.github.io/language-server-protocol/), and [Tree-Sitter](https://tree-sitter.github.io/tree-sitter/).

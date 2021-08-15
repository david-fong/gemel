# 🌳 Gemel

🚧 This project is in a pre-nascent stage.

This is a challenge to myself to prototype my speculative fiction-y thoughts- to realize proof-of-concept tooling for a programming experience with the following qualities centred on improving human interfaces:

- It is designed to remove friction from the collaborative programming experience by tightening integration of various developer tooling, and supporting collaborative, real-time editing. See [the dedicated readme](doc/design/01-collaboration.md).

- It builds the human-to-tool and tool-to-tool interfaces closer to the AST layer of abstraction rather than to text files, but tries to keep a somewhat familiar visual aesthetic. See [the dedicated readme](doc/design/02-ast.md).

- It treats terminology (words!) as a fundamental building-block of human-readable code. See [the dedicated readme](doc/design/03-words.md).

- It has some other miscellaneous (and less dramatic) features / design goals. See [the dedicated readme](doc/design/04-non-dramatic.md).

It will combine a collaborative, real-time [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed, general-purpose OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation). I will work on this until at least the year 2024.

Here are some important non-goals that you may find hard to swallow:

- Backward compatibility will not be promised or prioritized.
- FFI support may be possible, but it isn't a priority for this project.
- It is _not_ a goal to provide any compatibility with any existing languages, editors, VCS, or collaborative platforms.
  - Our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and any mechanism created to allow them to do so will probably require adding significant complexity. The same goes for the reverse direction of interoperability.

The hope is that gemel can be an experience compelling enough that people would be interested in moving toward such a direction and adopting some of its ideas as we slowly write and (even more slowly) embrace a better future.

For information about the project architecture and technical design goals, see [the dedicated readme](doc/design/architecture.md).

For more information about structure editors and existing projects, see [existing.md](doc/think/existing.md).

GitHub discussions are open for questions, concerns, ideas, and links to possibly helpful resources. The necessary groundwork before looking for help / contributions may not be ready until late 2022 or later.

# 🌳 Gemel

🚧 This project is in a pre-nascent stage.

## Vision

### What I want to make

A set of basic programming tools with friendlier human interfaces.

I will seek to achieve this by doing the following:

- Build the human-to-tool and tool-to-tool interfaces closer to code as structured data rather than as text files, but try to keep a somewhat familiar visual aesthetic to current-day IDEs. See [the dedicated readme](doc/design/core-goals/01-ast.md).

- Remove friction from the collaborative programming experience by tightening integration of various developer tools, and supporting collaborative, real-time editing. See [the dedicated readme](doc/design/core-goals/02-collaboration.md).

- Treat terminology (words!) as a fundamental building-block of a programming language. See [the dedicated readme](doc/design/core-goals/03-words.md).

- Misc (and less dramatic) features / design goals. See [the dedicated readme](doc/design/core-goals/04-non-dramatic.md).

It will combine a collaborative, real-time [structure editor](https://wikipedia.org/wiki/Structure_editor), strongly-typed, general-purpose OOP (maybe DSL-embeddable) language, and grammar-aware version-control system with some more builtin collaboration features. This (perhaps-obscene) amalgamation of commonly separated concerns is the inspiration for [the name of the project](https://wikipedia.org/wiki/Inosculation).

### Non-Goals

Preface: None of these are "ideological" non-goals. They are simply there to help me set boundaries / realistic expectations and restrain myself from getting derailed or burnt-out trying to tackle difficult (_but important_) problems that aren't core to the project's goals.

- Getting it "right" every step of the way.
- Compatibility with any existing languages, editors, VCS, or collaborative platforms.
  - Our current-day programming languages, IDEs, VCS, and collaboration platforms will probably not be able to adopt any of these ideas, and any mechanism created to allow them to do so will probably require adding significant complexity. The same goes for the reverse direction of interoperability.
- Runtime performance of code made with gemel (_not_ gemel itself).
- Providing any core libraries.
- Implementing grammars/mechanisms for fancy things like inter-process communication, async/coroutines, SIMD, etc.
- Supporting a keyboard-less application interface.
- Backward compatibility.
- FFI support (may be possible, but it isn't a goal).

### What impact I want gemel to have

The hope is that gemel can faithfully demonstrate benefits of structured programming at a high enough degree of quality to spark other peoples' interest in moving toward such a direction when designing future programming ecosystems.

I would love for gemel to gain interest as a proof-of-concept and exploring-ground for building a human-friendlier programming ecosystem. I would

I hope that they will also try to find grounds for compatibility, but I don't have faith that it's realistically achievable. Different programming languages exist because one size does not fit all. But who knows? We have things like LSP and tree-sitter, so maybe it is possible.

## Architecture

For information about the project architecture and technical design goals, see [the dedicated documents](doc/design/architecture/readme.md).

## Misc

For more information about structure editors and existing projects, see [existing.md](doc/info/01-existing.md).

I will work on this until at least the end of 2024. I currently feel like I'm interested enough in the problem to keep working on it until 2032, but I can't promise that.

GitHub discussions are open for questions, concerns, ideas, and links to possibly helpful resources. The necessary groundwork before looking for help / contributions may not be ready until late 2022 or later.

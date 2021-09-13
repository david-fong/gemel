# Build Interfaces on the AST Layer

Tradeoff: Do not care about whether the serialized form of the code is readable. This may make it difficult to share snippets of code...

This opens up the following opportunities:

- Change most of formatting style into developer configuration details: indentation, brackets and whitespace, and identifier casing conventions.

- Make the serialization format refer to things by numeric ids instead of textual ones, and have a parallel mapping from those ids to the human-readable given-names.
  - This can make renames easier to read in update histories, and easier to accept during dependency upgrades. The same goes for reordering parameters or fields, (though for fields, low-level serialization encodings would need a migration script).
    - Nagging doubt: anything made easy is implicitly encouraged- whether intended or not. Making renaming easy is not good for maintaining long-term relevance of side-channel/non-endorsed literature: Ex. Someone like fireship makes a textual or video tutorial. Next thing the creator or viewer knows, the terminology has suddenly changed, which becomes a source of confusion. That seems like a bad thing. Counterpoint: renames aren't the only things that makes non-endorsed literature outdated. Renames and any other kinds of breaking changes are generally motivated by the realization of a better alternative. The real question is how tolerant the ecosystem is to breaking changes and how much it wants the breaking change to happen.
  - This can make it easy to visually have named function parameters without having to type out the names (similar to filling out a web-form (one could press a key (conventionally the tab key, but arrow keys could be a better substitute) to skip an optional field, or hold it down to select from a list of remaining fields)).

- Displaying operator trees with prefix-notation, or using familiar operator placement and automatically displaying brackets to disambiguate order of operations.
  - I find operator precedence annoying because it's hard to memorize for each language, and easy to forget.

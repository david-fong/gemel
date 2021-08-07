# Miscellaneous Non-Dramatic Decisions

Here are some things that I will do that our existing technologies could also probably easily do (not all of them are expressly "improvements". some are just regular old choices):

## Hide Serialization and Improve IDE Interface

- Remove the choice of how to arrange the hierarchy for applications with multiple "dimensions" (Ex. web project with front and back ends and areas and multiple frontend concerns (HTML,CSS,JS)).
  - Provide ability to communicate multiple dimensions of hierarchies.
  - Provide ability to change viewing order of dimensions.

## Reading Code

- Make named return values. It's annoying to have to read the doc comment just to figure out what a return value of a method means. I believe that good names are often sufficiently good documentation. The name doesn't even have to have any ability to shorten caller code (although there's possibility that it could help to do that). This might be less helpful for generic collection types, but it will probably be much better than nothing.

- Make it easy to filter out information.
  - Show only declarations (hide definitions).
  - Show declarations and documentation.
  - Show only public declarations
    - Show private declarations used by the declaration under the currently selected declaration.

- Make it easy to trace or filter information like where exceptions might come from, where functions get called, etc.

- Make it easy to see which method calls perform mutations. Perhaps by coloring or emboldening or something like that.

## Editing Code

- Give really good autocomplete without needing fancy AI things.
  - Design the language grammar for disambiguation. Reduce need for forward lookahead.
    - Prefix keywords with (semi?)colons in statement contexts where user-defined identifiers could also go.
    - Use prefix notation for operators.
      - For subtraction and division (symmetric operations), choose one of the following:
        - just make unary operators for negation and reciprocation.
        - make operators `un+` and `un*` that represent "un-adding" and "un-multiplying".
      - Either require explicit delimiters/terminator for operators with unknown arity, or only require it when the dev wants to use the operator with more than the minimum arity.

## Programming Language Choices

### Miscellaneous

- Place comments and documentation after declaration signatures, but before code blocks. The rationale for declarations is that I often find the signatures to be self-documenting, or good enough to get a general idea of what the thing is. When the documentation goes first, you don't even get a good chance to see what's being documented. I think Python's got it right.

### Inheritance

Use delegation like Kotlin and automatically prompt for and display disambiguation information when inherited members have similar signatures.

## Provide Grammar and Analysis Tooling for Declaration Dependency Control
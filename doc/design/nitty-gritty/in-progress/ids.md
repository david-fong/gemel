# Identifier Sizes and Scopes

Ids are for nodes that can be referenced by other nodes. If a node will never be referenced, it doesn't need an id. Ex. code statements.

## Scopes

- Package Registry / "Repo Host":

- Package: Has closely related libraries and binaries. Atomic unit for being depended upon by other packages, having a maintainer, etc.

- Zone:

- AST Node (levels) inside a Zone:

## Think About

The nature of how something will be referenced and how much manual breakage resolution would be necessary were it to be moved. For those that have little to none, id-ing globally can be more useful.

## Options

Choose an AST Node's id size based on:

- How likely/frequently one might want to move it around within a kind of scope.
  - If it is unlikely, the id size can be

- How many instances might exist within a certain scope level.

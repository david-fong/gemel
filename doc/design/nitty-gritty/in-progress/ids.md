# Identifier Sizes and Scopes

Ids are for nodes that can be referenced by other nodes. If a node will never be referenced, it doesn't need an id. Ex. code statements. Id uniqueness requirements can be scoped to the smallest scope encompassing everywhere the node can be referenced.

## Scopes

- Package Registry / "Repo Host":

- Package: Has closely related libraries and binaries. Atomic unit for being depended upon by other packages, having a maintainer, etc.

- Zone:

- AST Node (levels) inside a Zone:

- Function:

## Think About

The nature of how something will be referenced and how much manual breakage resolution would be necessary were it to be moved. For those that have little to none, id-ing globally can be more useful.

## Options

Choose an AST Node's id size based on:

- How likely/frequently one might want to move it around within a kind of scope.

- How many instances might exist within a certain scope level.

## Hold Up

Am I overthinking this? `2^63` is already `9.223e+18`. If you have more than a million million of _any_ referenceable thing in a single package, I think running out of ids is the least of your problems. I guess there is the problem of retaining ids of deleted things from the oldest supported update, but if ids including deleted and added things are only needed to be kept unique for each pair of consecutive versions (assuming updates are applied one-by-one), you'd need to have an awful lot of stuff. The english wikipedia has ~6.4million articles. Encyclopedia Brittanica online has ~120K articles. In 2020, the Linux kernel was at ~27.8M lines of code. NPM currently (Sept 2021) has ~1.3M packages. So yes. 63 bits should be enough. Heck- even 31 bits (2147M) could be more than enough.

This is to say that scarcity of ids isn't an important concern when it comes to designing how most things can be referenced.

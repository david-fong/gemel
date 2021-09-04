# Packages

How will the ecosystem work?

- I'm thinking of tightly integrating it with the central repository system.

How will it be handled when dependencies / transitive dependencies want different versions of the same project?

If I make breaking changes to the serialization format, how will differences in serialization formats of dependencies and dependants be resolved? I really don't want to put devs in a position where they can get blocked from upgrading language version due to dependencies, and I also don't really want to put myself in a position where the serialization format can't change. I want to have a "flexible bytecode".

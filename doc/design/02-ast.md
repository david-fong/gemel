# Build Interfaces on the AST Layer

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

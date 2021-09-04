# Words

Note: My own thoughts on word choice can be found [here](https://gist.github.com/david-fong/58d7f538fc8cde5f626c512d13b8b30f).

- Make dictionaries (the for-humans kind; not the map data structure) a fundamental part of the code. Dictionaries define names and provide the definitions for those names.

- The names can be referenced in identifiers like those for classes, variables, functions, namespaces, etc.

- Names can be composed of other names or other compositions of names. They can be referenced in strings and comments.

- Common dictionaries for specific domains of programming can be curated and publicized in packages.

## Other Possible Ideas

- Spelling.
  - People having different preferences on brevity of terminology (ex "element" vs "elem" vs "el", or "event" vs "ev").
  - British and American spellings of words.
  - People who don't speak English needing to learn english in order to participate in open-source projects or use libraries.
  - Solution: What if our human-readable identifiers were represented as compositions of words, and we could have dictionaries of different spellings of those words? This starts building the foundation for things like standard dictionaries and automatic human-language translation.

- Allow for qualifying words as nouns, verbs, or variant-specifiers (like adjectives or adverbs). This could be used to enable sorting search results and zone tree entries by nouns while allowing the names to start with adjectives.

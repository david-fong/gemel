
## Resources

### Language Study

- https://en.wikipedia.org/wiki/Linguistic_relativity#Programming_languages

- https://en.wikipedia.org/wiki/Linguistic_typology
- https://en.wikipedia.org/wiki/Branching_(linguistics)
- https://en.wikipedia.org/wiki/Word_order
- https://en.wikipedia.org/wiki/Head-directionality_parameter
- https://en.wikipedia.org/wiki/Dependency_grammar

- https://en.wikipedia.org/wiki/Postpositive_adjective

### Language Prevalence

- https://en.wikipedia.org/wiki/List_of_languages_by_number_of_native_speakers
  - Mandarin, Spanish, English, Hindi, Arabic, Portuguese, Bengali, Russian, Japanese, Punjabi, German, ...
- https://en.wikipedia.org/wiki/Languages_used_on_the_Internet

- https://en.wikipedia.org/wiki/English_in_computing

## Variable Type and Name

Putting types before names makes sense for describing layout for low-level protocol _messages_ (ex. TCP headers, hardware IO interfaces, etc). Where manual data layout control (fiddling with ordering, padding / alignment) isn't a concern, it is more helpful to place names before types, assuming parts of objects are defined in a multiline fashion with left-alignment, and names and types not being formatted into distinct visual columns via whitespace.

## Function Name Before, After, or Between Args

English is a Subject-Verb-Object language read from top-to-bottom and left-to-right.

In OOP, there isn't really a subject (I don't think?). The current convention is weird if you think about it: functions are a verb with multiple objects where the verb goes first, and methods are the same except one of the objects is special and goes before the verb.

Another big consideration is autocomplete and viewing a deep chain of function composition.

## Adjectives


## Collections

Is it more common across spoken languages to say "three cats" or "cats three"?

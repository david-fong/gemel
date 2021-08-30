# Keywords and Symbols

## For Humans

- Zone Declaration: ` @ ` or ` / `
- Zone Auto-Disambiguation Separator: ` / `
- Dictionary: ` " ` or ` "" `
  - Noun Specifier: ` : ` (same as in variable editing)
  - Verb specifier: `` ` `` (same as in action declaration)
  - Adjective / adverb / variant name: ` ~ ` (? not decided on this)
- Explainer: ` * `

## Variables and Functions

- Variable Declaration: ` :: `
- Variable Edit: ` : `
- Calculation: ` $ ` or ` = `
- Action: `` ` ``

## Brackets

- Statement Block Enclosure: ` {} `
- Value Input List Declaration: ` () `
- Value Input List Provision: ` () `
- Type Input List Declaration: ` <> `
- Type Input List Provision: ` <> `

or perhaps if the placements are very well defined (while still being configurable) for value and type inputs, the bracket types should be the same?

- Throw Exception: ` ! ` (? not decided on this)

## Class Definition

- Class -> Embedded Objects: ` " ` or ` '' `
- Class -> Parts: ` ' `
- Class -> Traits: ` ~ `
- Class -> Static Parts: ` 1' `

## Value Reading

- Part Access: ` ' ` (same as in class def)
- Collection Element Access: ` @ `

## Collection Sugar

- Fixed-Size Ordered Collection: ` #N:T ` where N is an integer literal or a compile-time constant and T is the element type.
- Variable-Size Ordered Collection: ` ##:T ` where T is the element type.
- Unordered Variable-Size Collection: ` #'T ` where T is the element type.
- Map: ` #'K:V ` where K is the key type and V is the value type.
- Others: ` #;stack:T `, ` #;queue:T `.

## Type Modifiers

- Nullable: ` 00/ ` (as a prefix)

## Configurability

I'd originally been planning to allow devs to configure what symbols/names to use for these (I thought it would be cool to make it themeable like a color scheme), but now I'm not sure. The more that is made configurable, the less developers will be able to communicate through mediums which don't provide their custom theming. Color schemes are pretty harmless in that respect; the grammar is still somewhat harmless; but symbols probably not so, as long as the symbols are somewhat abstract ideograms. Perhaps it would be better to just focus on choosing good values to be enforced.

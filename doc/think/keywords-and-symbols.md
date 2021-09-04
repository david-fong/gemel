# Keywords and Symbols

## Early Restrictions

- Don't use ` = ` for assignment / modification.
  - It's a conceptual hurdle to beginners and I think it's both worthwhile and no too costly (in terms of burden for existing programmers) to fix.
- Don't use ` & ` for references. ` * ` is somewhat okay, but push for ` @ `.

## Cautions to Self

- If possible, I would like dev-chosen-names to be able to have colons in them so they can be used in names for variables holding a map (disallowing them as the first and last character are okay).

## For Humans

- Zone Declaration: ` @ ` or ` / `
- Zone Auto-Disambiguation Separator: ` / `
- Explainer: ` * `
- Dictionary: ` " ` or ` "" ` or ` ": `
  - Noun Specifier: ` : ` (same as in variable editing)
  - Verb specifier: `` ` `` (same as in action declaration)
  - Adjective / adverb / variant name: ` ~ ` (? not decided on this)

## Variables and Functions

- Variable Declaration: ` ' ` or ` @' ` or ` :: `
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

- Class -> ` #' ` or ` #" ` or ` #'" ` ? object is like a specialized dictionary.
- Class -> Embedded Objects: ` '# ` or ` " ` or ` '' `
- Class -> Parts: ` ' `
- Class -> Traits: ` ~ ` or
- Class -> Static Parts: ` # ` or ` 1' `

## Value Reading

- Part Access: ` ' ` (same as in class def)
- Collection Element Random-Access: ` @ `

## Collection / Container Sugar

Note to self: keep in mind whatever symbols will be used for mutability, nullability, ownership/heaped etc. and make sure there are no conflicts / ambiguities.

The fact that I'm coming up with such terse notations for these makes me jealous for the sake of primitive types 😅. Maybe I should try to come up with terse notations for those too.

### Random-Access-Capable

- Fixed-Size Ordered Collection: ` #N@T ` where N is an integer literal or a compile-time constant and T is the element type.
- Variable-Size Ordered Collection: ` ##@T ` where T is the element type. hehe this looks like a tie-fighter.
- Unordered Variable-Size Collection: ` #'@T ` where T is the element type.
- Map: ` #'@K:V ` where K is the key type and V is the value type.
- Others: ` #;stack:T `, ` #;queue:T `. Note: Implementation may choose to expose itself as non-random-access-capable.

### Non-Random-Access-Capable

- Iterable: ` #> ` or ` #, `
  - I'm always wary of how hard to see/distinguish a comma is. The angle bracket only makes sense to people who speak LTR languages, but I think bidirectional human-readable-code is out of my problem-solving depth.
- Future/Promise: ` #..T `
- Asynchronous Iterable (Stream): ` #>..T ` or ` #,.. `

## Type "Modifiers"

- Nullable: ` #?T ` or ` 00/T ` where T is the element type.
  - I like how the double-zero option reads, but the question-mark notation is much more widespread, and it opens up the nice opportunity to do the same-content-and-container-symbols thing: `T?'field`
- Reference: ` #@T ` where T is the value type.
  - I think the at-sign option is super friendly (intuitive) to most people. I'm just worried about it conceptually clashing with the same usage for containers capable of random access... I think it's okay- it's like- here, you don't need to provide any further addressing information, because it is the address.

- Mutable: ` : ` ? (as a prefix (only allowed before the typename of the value of a variable, or the the typename of the value referenced by a reference)).
- Compile-time Constant: ` . `.

Should I make these so easily composable? Does it make sense to be able to "nest" referencing or nullability? mutability definitely should be a special case (only allowed in specific ways).

## Configurability

I'd originally been planning to allow devs to configure what symbols/names to use for these (I thought it would be cool to make it themeable like a color scheme), but now I'm not sure. The more that is made configurable, the less developers will be able to communicate through mediums which don't provide their custom theming. Color schemes are pretty harmless in that respect; the grammar is still somewhat harmless; but symbols probably not so, as long as the symbols are somewhat abstract ideograms. Perhaps it would be better to just focus on choosing good values to be enforced.

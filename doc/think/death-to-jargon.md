# Avoid "Arbitrary Jargon"

Note: This was originally treated as a key design goal, but it has been replaced with the goal of making keywords swappable almost like a color theme.

Guiding principle 2: Aim for something that someone entering an english-speaking high-school would understand.

Guiding principle 1: Do _not_ touch names of standardized protocols and encoding schemes and such (ex. http, floating-point, 2's-compliment signed integers, utf8, ascii, png, etc.), and always follow terminology used in protocol/encoding specifications, unless the communities developing them expressly desire that the terminology be changed in the future. Go as far as preferring protocol/encoding names over more friendly terminology. Since this directly interferes with the goal of being more friendly to the general public, encourage beginning doc comments with a short and simply-worded tag-line, and as a last resort, provide a per-project configuration mechanism to opt in to friendlier aliases such as "text" for utf8.

Tradeoff: Do this even at the cost of being unfamiliar or annoying to the general programming or mathematics population.

Some of this will not even show up as keywords when writing code. I'm also trying to think about the way that programmers _talk_ to each other about code, and to make that conversation more parse-able to people without experience in programming.

## Organization

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| namespace / module / package  | folder          | I think the least ambiguous word we use is "namespace", but I don't think any person will figure out what we use it to mean until it's explained to them. I don't think "folder" has that problem. |
| comment                       | explainer       | "Comment" does not imply any degree of usefulness. In fact, "passing comment" is a common phrase meaning "a cheap personal remark", which is totally contrary to what code "comments" are supposed to do. "Explainer" can leverage the common wisdom that the obvious doesn't need to explained, which is a common misuse of code "comments". |

## Functions

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| function                      | action / calculation | "calculation" for pure functions. I don't really want to use "function" because in math, a function isn't something to be "called" or "performed". |
| function parameter / argument | need            | (I'm iffy on this one.) "Need" has a nice property of being both a verb and a noun, which decreases the amount of lingo: we no longer need to have the word "take" (as in "function has parameter which takes argument"): all of "parameter", "argument", and "take" are replaced by "need", which is kinda nice. If I decide to keep with the word "function", I'll probably go with "input" here. I anticipate it being confusing how "need" sounds when you want to specify an optional / "maybe"-type value, but I think it's still a liveable offence, especially since "need" will not be written in the code. |
| return /return value          | answer          | To the average person, the most common meaning of the word "return" means "to give back something that was borrowed". "Answer" goes well with the terminology of "call" and "function", but it doesn't go well with "action", so I'll have to think about that. "Answer" also has the nice property of being a verb and a noun. |
| call                          | do              | "do" works better with "action" |

## Common Statement Keywords

I will try to consistently choose verbs as statement keywords. I think it will be easier on the mind to have a consistent "POV". Using verbs gives the POV of instructing the computer / runtime what to do. I will also try to choose words that don't feel out of place for very low or high-level programming.

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| var / val / let / const / def | have            | I want to choose a really short (in terms of characters) and simple word that implies at least a little bit of relation to allocating "physical", stateful memory space. "var", "val", and "const" aren't verbs, and "let" and "def" feel very math-y and theoretical to me- describing stateless relations kind of like combinational logic in hardware-description languages. |

## Classes And Types

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| field / member variable       | part            | |
| interface / virtual functions | trait | (Piggybacking off of Rust here). "Trait" is an uncommon word, but it's meaning is suitable. The word "interface" is quite broad, and doesn't work as well languages that don't defaults methods to be virtual functions. Interestingly, I think friendliness to the general public is not very helpful here, since virtual functions are a pretty specific mechanism; having a less common word may help when learning it. |
| extends                       | embeds          | Runner ups: integrates / implants / ingrains / attaches. I'll talk more about this later. I want to expose "extension" more as a special kind of "composition". |
| abstract methods              | embedder trait  | |

## VCS

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| commit                        | update          | Unlike "commit", "update" is naturally both a verb _and_ a noun. I'm wary that "update" could be conflated with a "release", so that distinction will need to be made clear. |
| pull-request / branch         | update proposal | (First of all- yes, I am combining PR branches and PRs. I'll explain more later.) |

## Misc

| Instead Of                    | Use             | Why |
|-------------------------------|:---------------:|-----|
| string                        | utf8 text, ascii text, etc. | The historical rationale for the choice of the word "string" was pretty ridiculous. By the same logic, "string" could mean an ordered collection of pretty much anything. "string" carries no information about what the encoding is, and I think being aware of common encodings is important to non-beginners. Discourage using anything other than utf8 except when necessary to interface with things that insist on anything else. |
| array reduce                  | summarize       | |

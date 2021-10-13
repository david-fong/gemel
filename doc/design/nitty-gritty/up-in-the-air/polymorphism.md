

I'll try to learn from Rust's dyn (trait object) mechanism for doing things involving vtables. https://doc.rust-lang.org/book/ch17-02-trait-objects.html

See also https://github.com/tc39/proposal-first-class-protocols

But what about use cases where you want to query all typing information about an object at runtime? Ex. complicated class hierarchies like DOM node types? There should be a way to specify having an object with a pointer to all the useful polymorphism information at runtime. For these "ducky" type-types, I don't think the exact type will be used a lot (I'll need to think more about this), so it may be useful to be able to specify on the root type that holders of this type or its subclasses should default to the ducky type-type at runtime.

So for anything that has virtual-tabled things, it's possible to specify code that works with the exact type, a trait-object type, and a "ducky" type. At runtime, I think the ducky type can be converted to the others as long as the type is checked at runtime, but no other TT to TT conversions work.


What controls for extension? Should I provide anything more complicated than a boolean yes/no-this-class-can-be-extended? Come to think of it- is such a flag even useful? Thinking of "inheritance" as a kind of composition makes the mechanism seem kind of arbitrary. From a class' point of view, why would it care if someone else embeds it or not?

Note: when two superclasses implement/override a trait method, the derived class must provide an override which chooses how to resolve the provided options.

TODO: what should happen when there are multiple same embeds? Should it just be disallowed? If the embeds are all designed as "mixins", then this is preventable by making them depend on an embedder trait, but I don't think all embeds will be mixins... unless refactoring things as mixins just becomes a necessary evil in order to reuse logic. This may be a matter of performance/complexity tradeoffs in what goes into the runtime resolution logic.
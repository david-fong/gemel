

I'll try to learn from Rust's dyn (trait object) mechanism for doing things involving vtables. https://doc.rust-lang.org/book/ch17-02-trait-objects.html

But what about use cases where you want to query all typing information about an object at runtime? Ex. complicated class hierarchies like DOM node types? There should be a way specify having an object with a pointer to all the useful polymorphism information at runtime. For these "ducky" type-types, I don't think the exact type will be used a lot (I'll need to think more about this), so it may be useful to be able to specify on the root type that holders of this type or its subclasses should default to the ducky type-type at runtime.

So for anything that has virtual-tabled things, it's possible to specify code that works with the exact type, a trait-object type, and a "ducky" type. At runtime, I think the ducky type can be converted to the others as long as the type is checked at runtime, but no other TT to TT conversions work.


What controls for extension? Should I provide anything more complicated than a boolean yes/no-this-class-can-be-extended?
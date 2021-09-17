# Cool Things in Other Languages

In no particular order

- C# and kotlin terse accessor syntax.
- Rust's, Java match expression.

- Typescript similar notation for types and corresponding literal instantiations.

- [dart's meta annotations](https://api.flutter.dev/flutter/meta/meta-library.html).
- dart's continuation operator.
  - Taking this as "normal", then returning `this` to get the same effect is just a crutch for the lack of this grammatical mechanism.
  - I like the concept, but I would look for something terser.

- Rust traits and trait objects.
- Rust and [Go]((https://golang.org/ref/spec#String_literals) utf8 strings. Plenty other languages use utf16 implicitly and the fact isn't often touched upon in their communities (not many devs wonder, find out, or care).
  - Java: [the spec means utf-16 when it ways "code points"](https://docs.oracle.com/javase/specs/jls/se16/html/jls-3.html#jls-3.1), [strings use "code points"](https://docs.oracle.com/javase/specs/jls/se16/html/jls-4.html#jls-4.3.3)
  - [C#](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-encoding)
  - [ecmascript](https://es5.github.io/x2.html#x2)
  - [dart](https://api.dart.dev/stable/2.13.4/dart-core/String-class.html)

- kotlin's various async things.
- kotlin's separation of array streaming methods that delay evaluation and those that don't.
- kotlin's async functions being able to be called as blocking functions in functions not marked as async. [docs](https://kotlinlang.org/docs/async-programming.html#coroutines)
- kotlin and C++ defaulting classes to be sealed and methods to be non-virtual.
- [kotlin's solution to the diamond problem](https://en.wikipedia.org/wiki/Multiple_inheritance).

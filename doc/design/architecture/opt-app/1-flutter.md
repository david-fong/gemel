# Option: Flutter

(Note: I haven't used flutter before. I've linked below some resources that I'm reading to learn about it).

- [Its architecture](https://flutter.dev/docs/resources/architectural-overview)
  - ^A great read!
  - [inside flutter](https://flutter.dev/docs/resources/inside-flutter#linear-reconciliation)
  - [faq](https://flutter.dev/docs/resources/faq)
  - [state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
    - [tutorial for pros and cons](https://blog.codemagic.io/flutter-tutorial-pros-and-cons-of-state-management-approaches/)
  - [keys](https://api.flutter.dev/flutter/foundation/Key-class.html)

## Attractive properties

- Cross platform _native_ application development _and_ a web target.
  - No need to implement bridging between the sandboxed browser environment and the machine hosting the webview, no need for the mental overhead of developing in two languages (usually with very different runtimes).
- It sounds exciting to try something designed with the benefit of hindsight from the web and react-like interactive frameworks. Not to mention the dart language.

## Things that are a relief to know

- The roadmap is heavily influenced by user feedback: https://github.com/flutter/flutter/wiki/Roadmap#support-for-platforms-beyond-mobile
- At a surface level, it is apparantly on par with or better than React Native.
- Here's an IDE someone is building with flutter: https://www.youtube.com/watch?v=xyq6a8pfkVE&ab_channel=EthanElshyeb

## Things that I worry about and need to look into

- Desktop support is _still in beta_:
  - https://github.com/flutter/flutter/wiki/Desktop-shells
  - https://flutter.dev/desktop
- The build process for desktop requires having a machine with that OS and OS-specific tooling. There might be a GitHub action to streamline this for releases.
- I need to learn how to use it :P
  - The general widget documentation is major information overload sorted in alphabetical order. I need to find documentation for learning the basics / most commonly used building blocks.
- Just for curiosity's sake, look through the top issues on GitHub.
  - [Reusing state logic is either too verbose or too difficult](https://github.com/flutter/flutter/issues/51752)

## Other useful/interesting links

- https://pub.dev/flutter/favorites
- https://api.flutter.dev/flutter/services/MethodCodec-class.html
- https://api.flutter.dev/flutter/widgets/RichText-class.html
- https://dart.dev/tools/pub/package-layout
- https://github.com/Solido/awesome-flutter
- https://itsallwidgets.com/

## State Management

Need something that:

- can performantly update widgets high up in the tree without rebuilding everything beneath them.
- allows for easily reusing model code between client and server (where presumably, the flutter libraries will not be depended upon).

[`ValueListenableBuilder`](https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html) has a nifty mechanism: the builder takes a third argument named "child" for a child widget tree that shouldn't rebuild upon changes.

All these interfaces are part of the Flutter foundation library (which I presumably don't want in the server package), so I can't design my AST nodes with all the fields being `ValueNotifiers`.

1. Write some [code generation](https://www.raywenderlich.com/22180993-flutter-code-generation-getting-started) scripting for the clientside to generate parallel classes for the AST nodes where every field is instead a `ValueListenable` that hooks into the get/set pairs.

1. Then, either:
    - subclass the originals and add them through
      - extension/mixin
      - composition <- I like this one the most because of the cognitive information scoping.
    - maintain a parallel AST (not sure if this is a clean approach when it comes to hooking into the getters/setters).

1. For all of these options, instances of the original nodes will need to have references to the "listenable" nodes, and override its own get/set pairs to hook into the listenable nodes. The choice may also depend on whichever results in easier [JSON codegen](https://flutter.dev/docs/development/data-and-backend/json).
    - or... a weird alternative would be to generate the AST nodes with the `ValueNotifier` fields, and override the regular fields to delegate to the corresponding `ValueNotifier`.

## Verdict

Interested in using. Will try it out.

## For linking to LLVM:

- https://flutter.dev/docs/development/platform-integration/c-interop
- https://pub.dev/packages/ffigen
- https://github.com/samber/llvm_dart_binding

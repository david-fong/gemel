# Option: Flutter

(Note: I haven't used flutter before. I've linked below some resources that I'm reading to learn about it).

- [Its architecture](https://flutter.dev/docs/resources/architectural-overview)
  - ^A great read!
  - [inside flutter](https://flutter.dev/docs/resources/inside-flutter#linear-reconciliation)
  - [faq](https://flutter.dev/docs/resources/faq)
  - [state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

- Attractive properties:
  - Cross platform _native_ application development _and_ a web target.
    - No need to implement bridging between the sandboxed browser environment and the machine hosting the webview, no need for the mental overhead of developing in two languages (usually with very different runtimes).
  - It sounds exciting to try something designed with the benefit of hindsight from the web and react-like interactive frameworks. Not to mention the dart language.

- Things that are a relief to know:
  - The roadmap is heavily influenced by user feedback: https://github.com/flutter/flutter/wiki/Roadmap#support-for-platforms-beyond-mobile
  - At a surface level, it is apparantly on par with or better than React Native.
  - Here's an IDE someone is building with flutter: https://www.youtube.com/watch?v=xyq6a8pfkVE&ab_channel=EthanElshyeb

- Things that I worry about and need to look into.
  - Desktop support is _still in beta_:
    - https://github.com/flutter/flutter/wiki/Desktop-shells
    - https://flutter.dev/desktop
  - The build process for desktop requires having a machine with that OS and OS-specific tooling. There might be a GitHub action to streamline this for releases.
  - I need to learn how to use it :P
    - The general widget documentation is major information overload sorted in alphabetical order. I need to find documentation for learning the basics / most commonly used building blocks.
  - Just for curiosity's sake, look through the top issues on GitHub.
    - [Reusing state logic is either too verbose or too difficult](https://github.com/flutter/flutter/issues/51752)

- Other useful/interesting links:
  - https://pub.dev/flutter/favorites
  - https://api.flutter.dev/flutter/services/MethodCodec-class.html
  - https://api.flutter.dev/flutter/widgets/RichText-class.html
  - https://dart.dev/tools/pub/package-layout

- Verdict: Interested in using. Will try it out.
  - I'm feeling really overwhelmed by the number of state management methods, but coming from the web world where there are a hundred ways to do every single thing, I guess I can't complain much. I'm wondering if I can start by just having a big global tree containing state, and streams to notify the widget tree of granular state changes (using [StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html)).

- for linking to LLVM:
  - https://flutter.dev/docs/development/platform-integration/c-interop
  - https://pub.dev/packages/ffigen
  - https://github.com/samber/llvm_dart_binding

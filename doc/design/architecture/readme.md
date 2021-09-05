# Architecture

Note: The project currently uses a monorepo. It may be split into separate repos in the future once the design has stabilized. Or perhaps [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) can be used to provide a convenience monorepo to simplify getting contributors up and running.

## Requirements

- Make a cross platform desktop application.

- Hearken to the look-and-feel and quality of VS Code.

- Enable writing, compiling and running code without an internet connection.

- Design to keep resource usage (disk, memory, network) on the user's machine low.

- Favour a simple architecture and easy code reuse.

## Choices to Make

### Application Platform and Framework

- Terminal TUI: Nope. Can't do panels with smooth scrolling or any text that isn't aligned to the character grid.

- A browser-based solution (ex. electron, NW.js, tauri, Sciter, Kotlin multiplatform).
  - For a web frontend, I'd be looking for a DOM library that is light, simple to use, performant, and doesn't abstract too far away from standard HTML/CSS/JS. A project with a strong community backing is a big nice-to-have- I want to use something that will be well supported in the future, but I will look for something that I could live with even if further development for it was dropped tomorrow.

- Desktop things: Qt, JavaFx, JUCE, WxWidgets, etc.

- React Native, Proton Native

- Flutter

See the [./opt-app/](./opt-app/) folder for the dedicated evaluation documents.

### Supporting Coding in Browser

- I'm on the fence about whether to support interacting with code outside of the native app. Rejecting that capability would have huge consequences: no StackOverflow code, no inline code in blog posts and tutorial writings, etc. The thing I don't like about posting code snippets is that there isn't much incentive to keep them up to date as technology evolves, or even to notify readers that technology _has_ evolved. I guess that's not limited to just code snippets though...
  - StackOverflow and Medium could possibly be substituted by just incentivizing project maintainers (including those of gemel itself) to provide helpful examples and documentation, and building in to the platform channels for asking for help.
    - This certainly fits with the theme of gemel, but this feels like too much.

### Communications

WebSockets and JSON are pretty widely implemented.

P2P protocol implementations are not really mature especially for relatively newer languages like Rust and Dart. [WebRTC](https://webrtcforthecurious.com/docs/01-what-why-and-how/) is well supported in major browsers.

- Is P2P communications really necessary? It would be helpful if many people are watching somebody code from different devices (like a massive code streaming session?), but how often does this really happen? And what about implementing permissions such that only some people can send suggestions? I might need a "server" in the group to act as a source of truth. Perhaps it would be best if I just started with WebSockets and look at the possibility of P2P later.

Using [CBOR](https://cbor.io/spec.html) may be less friendly (compared to JSON) if people want to build their own clients to the communications API.

- https://github.com/hildjj/cbor-wasm
- CBOR still encodes keys as strings, so some kind of compression (brotli?) will still be useful when transporting large messages with repeated string values... At this point, maybe it's just better to stick to JSON?

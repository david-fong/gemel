# Motivating Goals

## Hearken to VS Code

Why not focus on a terminal TUI or use a UI framework like Qt?

- All three have historical things-that-are-not-so-nice / eccentricities that just need to be lived with.
- Terminal TUIs can't do panels with smooth scroll or anything that needs alignment outside of a full-window character-grid.
- The web is resource hungry, but it's very capable, and many people are familiar with developing for it to some degree (probably many more people than for TUIs or other UI frameworks).
- I only have experience with web development. I have some experience navigating its many quirks. Not so for any TUI development or Qt.

## Implement Compiling and Running Code

- Try to keep resource-usage at runtime low.
- Avoid any need for manually mirroring models / logic, and I want to have a reasonably fast tool for automatically generating necessarily duplicate code.

- I'm on the fence about whether to support interacting with code outside of the native app. Rejecting that capability would have huge consequences: no StackOverflow code, no inline code in blog posts and tutorial writings, etc. The thing I don't like about posting code snippets is that there isn't much incentive to keep them up to date as technology evolves, or even to notify readers that technology _has_ evolved. I guess that's not limited to just code snippets though...
  - StackOverflow and Medium could possibly be substituted by just incentivizing project maintainers (including those of gemel itself) to provide helpful examples and documentation, and building in to the platform channels for asking for help.
    - This certainly fits with the theme of gemel, but this feels like too much.

- I want to use protocols designed for efficiently passing messages between machines in a group.
  - I will look for protocols that have implementations in many popular languages. Rationale: If I use a protocol that only has good frontend support, I'm closing off the opportunity of non-web frontends, and if I choose something that doesn't have a in-web-compatible implementation, then I'm closing off functionality from being available for a web-only experience, which is a nice-to-have for introducing people to the project.
  - I'm looking for a P2P transport.
  - I'm looking for a binary encoding, but if I can't find one, I'll go with JSON.
    - A small serialization format may not have much benefit compared to P2P comms, so it may be worth just using JSON for the sake of simplicity...
  - I will look for a dataflow that avoids duplication of dependencies and keeps the source-code simple.

- For the web frontend, I'm looking for a DOM library that is light, simple to use, performant, and doesn't abstract too far away from standard HTML/CSS/JS. A project with a strong community backing is a big nice-to-have- I want to use something that will be well supported in the future, but I will look for something that I could live with even if further development for it was dropped tomorrow.

## Some Decisions

- For P2P comms, I'll use the webview's WebRTC (maybe through libp2p, but right now the rust implementation doesn't come with support for the webRTC transport (though there is [a pure rust implementation](https://webrtc.rs/))).
  - More about WebRTC:
    - https://webrtcforthecurious.com/docs/01-what-why-and-how/

- For the encoding of data in transport, I'll look into using [CBOR](https://cbor.io/spec.html).
  - https://github.com/hildjj/cbor-wasm
  - CBOR still encodes keys as strings, so some kind of compression (brotli?) will still be useful when transporting large messages with repeated string values... At this point, maybe it's just better to stick to JSON?
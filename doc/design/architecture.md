# Project Architecture

## Motivating Goals

- I want a web-browser UI to communicate with the host system in order to compile and run code.
  - I want resource-usage at runtime to be low.
  - I want to avoid any need for manually mirroring models / logic, and I want to have a reasonably fast tool for automatically generating necessarily duplicate code.

- I'm on the fence about whether to support interacting with code outside of the native app. Rejecting that capability would have huge consequences: no StackOverflow code, no inline code in blog posts and tutorial writings, etc. The thing I don't like about posting code snippets is that there isn't much incentive to keep them up to date as technology evolves, or even to notify readers that technology _has_ evolved. I guess that's not limited to just code snippets though...
  - StackOverflow and Medium could possibly be substituted by just incentivizing project maintainers (including those of gemel itself) to provide helpful examples and documentation, and building in to the platform channels for asking for help.
    - This certainly fits with the theme of gemel.

- I want to use protocols designed for efficiently passing messages between machines in a group.
  - I will look for protocols that have implementations in many popular languages. Rationale: If I use a protocol that only has good frontend support, I'm closing off the opportunity of non-web frontends, and if I choose something that doesn't have a in-web-compatible implementation, then I'm closing off functionality from being available for a web-only experience, which is a nice-to-have for introducing people to the project.
  - I'm looking for a P2P transport.
  - I'm looking for a binary encoding, but if I can't find one, I'll go with JSON.
    - A small serialization format may not have much benefit compared to P2P comms, so it may be worth just using JSON for the sake of simplicity...
  - I will look for a dataflow that avoids duplication of dependencies and keeps the source-code simple.

- For the web frontend, I'm looking for a DOM library that is light, simple to use, performant, and doesn't abstract too far away from standard HTML/CSS/JS. A project with a strong community backing is a big nice-to-have- I want to use something that will be well supported in the future, but I will look for something that I could live with even if further development for it was dropped tomorrow.

## Decisions

- To support natively compiling and running, I will use [tauri](https://github.com/tauri-apps/tauri) and the LLVM.

- For P2P comms, I'll use the webview's WebRTC (maybe through libp2p, but right now the rust implementation doesn't come with support for the webRTC transport (though there is [a pure rust implementation](https://webrtc.rs/))).

- For the encoding of data in transport, I'll look into using [CBOR](https://cbor.io/spec.html).
  - https://github.com/hildjj/cbor-wasm
  - CBOR still encodes keys as strings, so some kind of compression (brotli?) will still be useful when transporting large messages with repeated string values... At this point, maybe it's just better to stick to JSON?

- For the web frontend, here are the DOM technologies I'm considering using, in order of interest:
  - solid.js
    - https://github.com/solidjs/solid/blob/main/documentation/resources/projects.md#starters
  - lighterhtml
    - See [this handy comparison of lighterhtml and lit-html](https://webreflection.medium.com/lit-html-vs-hyperhtml-vs-lighterhtml-c084abfe1285).tml or lit-html

- Is it a reasonable design choice for Gemel to use a web UI framework?
  - Motivation: [VS Code doesn't use a UI framework](https://www.youtube.com/watch?v=gnKzJRr-rd0&ab_channel=VisualStudioCode)!- to maximize performance by being as close to the DOM as possible. Personal note: As someone who cares about runtime elegance and who started doing things with no UI framework or library and actually enjoyed it, this sounds very tempting.
  - But:
    - I have a feeling that I won't be able to scale that for a more complicated project like this one. Hand optimization is hard.
    - VS Code started around 2015, React around 2013, and Solid around 2018 and only recently released v1.0. Solid promises abstraction with high performance, which is exactly what I'm looking for. Perhaps if Solid existed when VS Code began, they may have considered it as a suitable tool.
    - VS Code is an IDE for interfacing with _text files_. Gemel is not. It makes way more sense for gemel to take advantage of the hierarchical capabilities of the DOM. Gemel doesn't need to deal with many of the performance and complexity challenges that arise from having to maintain a visage of a text file.

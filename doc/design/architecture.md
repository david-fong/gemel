# Project Architecture

## Motivating Goals

- I want a web frontend to communicate with the host system in order to compile and run code.
  - I want a lightweight stack.
  - I want to avoid any need for manually mirroring models / logic, and I want to have a reasonably fast tool for automatically generating necessarily duplicate code.

- I want to use protocols designed for efficiently passing messages within a group of machines.
  - I will look for protocols that have implementations in many popular languages. Rationale: If I use a protocol that only has good frontend support, I'm closing off the opportunity of non-web frontends, and if I choose something that doesn't have a in-web-compatible implementation, then I'm closing off functionality from being available for a web-only experience, which is a nice-to-have for introducing people to the project.
  - I'm looking for a P2P transport.
  - I'm looking for a binary encoding, but if I can't find one, I'll go with JSON.
    - A small serialization format may not have much benefit compared to P2P comms, so it may be worth just using JSON for the sake of simplicity...
  - I will look for a dataflow that balances minimizing duplication of dependencies, keeping the code simple, and not compromising performance.

- For the web frontend, I'm looking for a DOM library that is light, simple to use, and doesn't abstract too far away from standard HTML/CSS/JS. A project with a strong community backing is good- I want to use something that won't be well supported in the future.

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

- Should I use a frontend framework?
  - [VS Code doesn't use a UI framework](https://www.youtube.com/watch?v=gnKzJRr-rd0&ab_channel=VisualStudioCode)!- to maximize performance by being as close to the DOM as possible. As someone who started doing things with no UI framework or library and actually enjoyed it, this is super encouraging. But I have a feeling that I won't be able to scale that for a more complicated project like this one; my main web project (capswalk) focuses a lot on optimizing one part of the UI and I've mostly ignored the other parts of the UI (moral: hand optimization is not easy to write). And it may be helpful to keep in mind that VS Code started around 2015, React around 2013, and solid.js around 2018 and only recently released v1.0. Solid.js promises abstraction with high performance, which is really what I'm looking for (simple code is a goal), and I believe it can also be a sustainable choice in the long term. Of course, I'll need to try it out to get a better feel for whether that's truly the case.

# Project Architecture

## Motivating Goals

- I want a web frontend to communicate with the host system in order to compile and run code.
  - I want a stack that isn't as resource-hungry as electron.
  - I want the code to be kept ask simple as possible.

- I want to use protocols designed for efficiently passing messages within a group of machines.
  - I will look for protocols that have implementations in many popular languages. Rationale: If I use a protocol that only has good frontend support, I'm closing off the opportunity of non-web frontends.
  - I'm looking for a P2P transport.
  - I'm looking for a binary encoding, but if I can't find one, I'll go with JSON.
  - I will look for a dataflow that balances minimizing duplication of dependencies, keeping the code simple, and not compromising performance.

- For the web frontend, I'm looking for a DOM library that is light, simple to use, and doesn't abstract too far away from standard HTML/CSS/JS.

## Decisions

- To support natively compiling and running, I will use [tauri](https://github.com/tauri-apps/tauri) and the LLVM.

- For P2P comms, I'll use the webview's WebRTC (maybe through libp2p, but right now the rust implementation doesn't come with support for the webRTC transport (though there is [a pure rust implementation](https://webrtc.rs/))).

- For the encoding of data in transport, I'll look into using [CBOR](https://cbor.io/spec.html).
  - https://github.com/hildjj/cbor-wasm
  - CBOR still encodes keys as strings, so some kind of compression (brotli?) will still be useful when transporting large messages with repeated string values.

- For the web frontend, here are the DOM technologies I'm considering using, in order of interest:
  - lighterhtml or lit-html (but probably lighterhtml)
    - See [this handy comparison](https://webreflection.medium.com/lit-html-vs-hyperhtml-vs-lighterhtml-c084abfe1285).
  - [RE:DOM](https://redom.js.org)
  - preact
  - Mikado?

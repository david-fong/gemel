# Structure Editor

This is a for-fun project to make a [structure editor](https://en.wikipedia.org/wiki/Structure_editor), programming language, and version-control system. I'm making it web-based since that's what I'm currently most comfortable with.

My goal is not to make something super decoupled and reusable. I'm going to mash all the things I want to do together. I want to try to create what is my idea of an enhanced version of the common programming experience today. I'm going to make a lot of mistakes and poor decisions, and what will likely happen is that I will create something that is much worse than what we commonly use today, but I'll try my best to improve and learn from it.

Of course, there are other projects that exist that already have very similar goals: [prune](https://www.facebook.com/notes/994298340981590/), [sapling](https://github.com/kneasle/sapling), [etc...](https://www.reddit.com/r/nosyntax/wiki/projects).

I won't go into the analysis of the possible benefits and disadvantages of structural editors here, since it's easy to find that stuff online.

## Things to Decide

- Do I want to support something like live code sharing where multiple people edit the same VCS branch together?

## Ideas

### Remove Stylistic Choices

- Separate indentation and newlines from the serialization structure and instead make it a clientside configuration detail.
- Remove the choice of how declarations should be ordered. Make the editor try to do what it thinks is best for the user.
- Remove the burden of choosing when to separate namespaces/modules declared in the same file into separate files. Provide something like shell `cd`.
- Make it easy to filter out information.
  - Show only declarations (hide definitions).
  - Show declarations and documentation.
  - Show only public declarations
    - Show private declarations used by the declaration under the currently selected declaration.
- Remove the choice of how to arrange the hierarchy for applications with multiple "dimensions" (Ex. web project with front and back ends and areas and multiple frontend concerns (HTML,CSS,JS)).
  - Provide grammar for communicating multiple dimensions of hierarchies.

### Give Really Good Autocomplete

- Design the language for disambiguation. Reduce need for forward lookahead.

### Provide Grammar for Fine-Grained Declaration Dependency Control

### VCS

- Linear history only.

### Ensure a Mechanism for Migrating Serialized Data Between Schemas

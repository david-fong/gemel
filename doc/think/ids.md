# IDs

Almost every node in the AST will have an ID. There will be different ID "scopes":

- Everything can first be scoped by a library/app id (standard libraries, dependencies, project library and applications). One byte could be sufficient for projects with few dependencies, but two bytes is much safer.

- Folders can have their own class of IDs. To keep the serialization format simple, it may be best to go with fixed-size, which would require conceptually flattening paths, which could be a good thing since it allows for moving folders around without changing the serialized id.

- Within a (flattened) folder, create scopes for each of


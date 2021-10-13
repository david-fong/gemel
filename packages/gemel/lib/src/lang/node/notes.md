# Notes

name fields can be final.

type fields can be final on definitions like classes and actions.

for things that where the type can be used as an interface open to various implementations, separate the type model from the implementation model. otherwise, feel free to mash them together. Things that separate models for type and implementation: actions. Things that don't: class.


export interface Node {

	serialize(): string;
}
export namespace Node {
	export enum TypeIds {
		Shebang,
		Folder,
		Variable,
		Function,
		Trait,
		Class,
		ClassMemberVariable,
		Statement,
		StringLiteral,
		NumberLiteral,
	}
}
export interface NodeClass {
	deserialize(stream: ReadableStream): Node;
}
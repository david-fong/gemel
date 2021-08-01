

export interface Node {

	serialize(): string;
}
export namespace Node {
	export enum TypeIds {
		Shebang,
		Namespace,
		Variable,
		Function,
		Class,
		ClassMemberVariable,
		Interface,
		Statement,
		StringLiteral,
		NumberLiteral,
	}
}
export interface NodeClass {
	deserialize(buf: string, index: number): { node: Node, parserAdvance: number };
}
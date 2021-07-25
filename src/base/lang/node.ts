

export interface Node {
	type: Node.TypeIds;

	serialize(): string;
	deserialize();
}
export namespace Node {
	export enum TypeIds {
		Shebang,
		Namespace,
		Variable,
		Function,
		Class,
		Interface,
		Statement,
		StringLiteral,
		NumberLiteral,
	}
}
export interface NodeClass {
	deserialize(buf: string, index: number): { node: Node, parserAdvance: number };
}
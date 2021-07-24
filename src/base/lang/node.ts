

export interface Node {
	type: Node.TypeIds;

	serialize(): string;
	deserialize();
}
export namespace Node {
	export type TypeIds
	= "shebang"
	| "namespace"
	| "variable-declaration"
	| "function"
	| "class"
	| "interface"
	| "statement"
	| "string-literal"
	| "number-literal"
	;
}
export interface NodeClass {
	deserialize(buf: string, index: number): { node: Node, parserAdvance: number };
}
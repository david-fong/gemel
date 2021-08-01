import { Node } from "../node";
import { Type } from "../type";
import { Node_ClassPart } from "./class-part";


export class Node_Class implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_Class {
		return undefined!;
	}
}
export namespace Node_Class {
	export interface Model {
		id: number;
		name: string;
		typeInputs: Type[];

		parts: Node_ClassPart.Model;
		inherits: Node_AbstractClass.Model;
		implement
	}
}
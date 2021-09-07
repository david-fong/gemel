import { Node } from "../node";
import { Type } from "../type";
import { Node_Exposure } from "./exposure";

/**
 * Note: Accessors (syntactic-sugary methods that are used with field notation)
 * do not go here. This is strictly for instance data.
 */
export class Node_ClassPart implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_ClassPart {
		return undefined!;
	}
}
export namespace Node_ClassPart {
	export interface Model {
		id: number;
		name: string;
		exposure: Node_Exposure.Model;
		type: Type;
	}
}
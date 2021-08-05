import { Node } from "../node";


export class Node_ClassAction implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_ClassAction {
		return undefined!;
	}
}
export namespace Node_ClassAction {
	export interface Model {
	}
}
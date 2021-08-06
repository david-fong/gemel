import { Node } from "../node";


export class Node_Trait implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_Trait {
		return undefined!;
	}
}
export namespace Node_Trait {
	export interface Model {
		id: number;
		name: string;
	}
}
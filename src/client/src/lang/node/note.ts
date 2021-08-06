import { Node } from "../node";


export class Node_Explainer implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_Explainer {
		return undefined!;
	}
}
export namespace Node_Explainer {
	export interface Model {
		id: number;
		name: string;
	}
}
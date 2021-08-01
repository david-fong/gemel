import { Node } from "../node";


export class Node_ClassInstFun implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_ClassInstFun {
		return undefined!;
	}
}
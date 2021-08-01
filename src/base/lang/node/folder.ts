import { Node } from "../node";


export class Node_Folder implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_Folder {
		return undefined!;
	}
}
export namespace Node_Folder {
	export interface Model {
		id: number;
		name: string;
		childrenRules: Model.ChildrenRules;
	}
	export namespace Model {
		export interface ChildrenRules {
			controlDependencies: boolean; // if true, also prevents circular dependencies.
			dictFromEnum: undefined | string;
		}
	}
}
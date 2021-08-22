import { Node } from "../node";


export class Node_Zone implements Node {
	public serialize(): string {
		throw new Error("Method not implemented.");
	}
	public static deserialize(stream: ReadableStream): Node_Zone {
		return undefined!;
	}
}
export namespace Node_Zone {
	export interface Model {
		id: number;
		name: string;
		childrenRules: Model.ChildrenRules | undefined;
	}
	export namespace Model {
		export interface ChildrenRules extends ChildrenRules.Kind {
			controlDependencies: boolean; // if true, also prevents circular dependencies.

		}
		export namespace ChildrenRules {
			export type Kind = {
				forEach: {
					in: number; // an enum ID.
					eachFollowsRule: ChildrenRules;
				} | {};
			};
		}
	}
}
import { Node } from "../node";
import { Type } from "../type";
import { Node_ClassAction } from "./class-action";
import { Node_ClassPart } from "./class-part";
import { Node_Trait } from "./trait";


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
		/** must be false to allow requiring embedder traits or unimplemented traits */
		hasIncompleteTraits: boolean;

		allowedEmbedders: undefined | {
		};
		embedded: Type[];
		parts: Node_ClassPart.Model;
		actions: Node_ClassAction.Model;
		/**
		 * To create abstract methods, create a trait and put it here unimplemented.
		 *
		 * To create overrideable methods, create a trait and put them here implemented.
		 */
		traits: TraitImplModel[]; // TODO
	}

	export interface TraitImplModel {
		traitId: Node_Trait.Model["id"];
		impl: undefined | Record<>;
	}
}
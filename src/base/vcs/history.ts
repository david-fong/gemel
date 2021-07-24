import { Dev } from "../common/dev";

/**
 * AKA "commit"
 *
 * A minimal group of change parts that combined do not result in a broken state.
 */
export interface Change {
	when: Date;
	author: Dev;
	explainer: string;
	parts: Change.Part[];
}
export namespace Change {
	export enum Kind {
		Add,
		Remove,
		Change,
	}
	export interface Part {
		kind: Kind;
		body: any;
		explainer: string;
	}
}

export interface Branch {
	name: string;
	base: Change;
	changes: Change[];

	/**
	 * Fancy magic. Ex. remove a change if a later change renders it useless.
	 *
	 * Or perhaps this is best left to the developer?
	 */
	normalize(): void;
}

export interface History {
	changes: Change[];
}
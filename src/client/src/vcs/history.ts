import { Dev } from "../common/dev";

/**
 */
export interface Update {
	title: string;
	explainer: string;
	isRelease: boolean;
	type: Update.Type;
	peopleToTell: Update.PeopleToTell;
	script: {
		code?: string;
		data?: string;
	}; // TODO
}
export namespace Update {
	export type Id = number;
	export enum Type {
		Addition, // opt-in optimizations do not go here.
		Correction_Minor,
		Correction_Major,
		ExplainerEdit,
		Rephrase, // ie. refactor
		Optimization,
	};
	export enum PeopleToTell {
		Contributors,
		CodeUsers,
		AppUsers,
	};
}

export interface UpdateHistory {
	updates: Update[];
}


export interface UpdateDraft {
	title: string; // must be unique on the server.
	base: Update.Id;
	explainer: string;
	changes: UpdateDraft.Change[];

	/**
	 * Fancy magic. Ex. remove a change if a later change renders it useless.
	 *
	 * Or perhaps this is best left to the developer?
	 */
	normalize(): void;
}
export namespace UpdateDraft {

	export interface Change {
		kind: Change.Kind;
		body: any;
		explainer: string;
		author: Dev;
	}
	export namespace Change {
		export enum Kind {
			Add,
			Edit,
			Remove,
		}
	}
}
import { Dev } from "../common/dev";

/**
 */
export interface Version {
	hasSnapshot: boolean;
	changelog: {
		migrate: string[];
		feature: string[];
		fix: string[];
	};
	updateDependantsScript: string; // TODO
}
export namespace Version {
	export type Id = number;
}

export interface History {
	versions: Version[];
}


export interface UpdateDraft {
	title: string; // must be unique on the server.
	base: Version.Id;
	when: Date;
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
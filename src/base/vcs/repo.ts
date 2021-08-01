import { Dev } from "../common/dev";
import { History } from "./history";

export interface Repo {
	devs: {
		/**
		 * Have the final say and ultimate responsibility for what happens to the
		 * repo.
		 */
		lead: Dev.Email[];
		/**
		 * Members committed to the project and trusted to review code.
		 */
		core: Dev.Email[];
	};
	history: History;
}
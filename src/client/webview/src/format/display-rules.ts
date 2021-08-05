import { Casing } from "./casing";


export interface DisplayRules {
	indentWidth: number;
	pageWidth: number;
	casing: {
		folder: Casing;
		variable: Casing;
		enum: Casing;
		type: Casing;
	};
	trailingListDelimiter: "before newline" | "never" | "always";
	lineBreak: {
		beforeOpeningBlock: boolean;
	};
}
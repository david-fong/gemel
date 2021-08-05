import { Node, NodeClass } from "./node";
import { Node_Folder } from "./node/folder";


export const Nodes: Record<Node.TypeIds, NodeClass> = {
	[ Node.TypeIds.Shebang ]: undefined!,
	[ Node.TypeIds.Folder ]: Node_Folder,
	[ Node.TypeIds.Variable ]: undefined!,
	[ Node.TypeIds.Function ]: undefined!,
	[ Node.TypeIds.Trait ]: undefined!,
	[ Node.TypeIds.Class ]: undefined!,
	[ Node.TypeIds.Statement ]: undefined!,
	[ Node.TypeIds.StringLiteral ]: undefined!,
	[ Node.TypeIds.NumberLiteral ]: undefined!,
}

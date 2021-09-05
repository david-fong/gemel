import { Node, NodeClass } from "./node";
import { Node_Zone } from "./node/zone";


export const Nodes: Record<Node.TypeIds, NodeClass> = {
	[ Node.TypeIds.Shebang ]: undefined!,
	[ Node.TypeIds.Zone ]: Node_Zone,
	[ Node.TypeIds.Variable ]: undefined!,
	[ Node.TypeIds.Function ]: undefined!,
	[ Node.TypeIds.Trait ]: undefined!,
	[ Node.TypeIds.Class ]: undefined!,
	[ Node.TypeIds.ClassMemberVariable ]: undefined!,
	[ Node.TypeIds.Statement ]: undefined!,
	[ Node.TypeIds.StringLiteral ]: undefined!,
	[ Node.TypeIds.NumberLiteral ]: undefined!,
}

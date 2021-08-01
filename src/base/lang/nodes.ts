import { Node, NodeClass } from "./node";


export const Nodes: Record<Node.TypeIds, NodeClass> = {
	[ Node.TypeIds.Shebang ]: undefined!,
	[ Node.TypeIds.Namespace ]: undefined!,
	[ Node.TypeIds.Variable ]: undefined!,
	[ Node.TypeIds.Function ]: undefined!,
	[ Node.TypeIds.Class ]: undefined!,
	[ Node.TypeIds.Interface ]: undefined!,
	[ Node.TypeIds.Statement ]: undefined!,
	[ Node.TypeIds.StringLiteral ]: undefined!,
	[ Node.TypeIds.NumberLiteral ]: undefined!,
}

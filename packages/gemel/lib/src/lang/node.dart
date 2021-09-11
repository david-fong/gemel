///
abstract class Node {}

///
class Explainer {
  String value = "";
}

///
abstract class ExplainableNode implements Node {
  final Explainer? explainer = null;
}

///
enum NodeKind {
  zone,
  word,
  vocab,
  explainer,
  typeBound,
  var$,
  funcType,
  func,
  trait,
  traitObjType,
  classType,
  classInstVar,
  class$,
  constNum,
  constText,
  statement, // is this necessary?
  statementScope,
  statementHave,
  statementEdit,
  statementWhen,
  statementFor,
  statementWhile,
  statementBreak,
  statementCont,
  statementTry,
  statementAnswer,
}

const Set<NodeKind> explainableNodeKinds = {
  NodeKind.zone,
  NodeKind.word,
  NodeKind.class$,
};

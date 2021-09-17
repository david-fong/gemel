///
class Explainer {
  /// A list of [WordId] and [String].
  // TODO design way to reference other declarations- not just words.
  final List<Object> value;
  Explainer(this.value);
}

///
mixin Explainable {
  Explainer? explainer;
}

///
enum NodeKind {
  zone,
  word,
  vocab,
  explainer,
  type,
  var$,
  funcTypeDef,
  func,
  trait,
  traitObjType,
  traitObjTypeUse,
  classType,
  classInstVar,
  classInstFunc,
  class$,
  constNum,
  constText,
}

///
enum StatementNodeKind {
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

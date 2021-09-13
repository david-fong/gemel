///
class Explainer {
  /// A list of [WordId] and [String].
  // TODO design way to reference other declarations- not just words.
  final List<Object> value;
  Explainer(this.value);
}

///
abstract class Explainable {
  final Explainer? explainer;
  Explainable({
    this.explainer,
  });
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

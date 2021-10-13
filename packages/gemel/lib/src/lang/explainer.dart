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
/* enum NodeKind {
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
} */

///
/* enum StatementNodeKind {
  scope,
  have,
  edit,
  when,
  for$,
  while$,
  break$,
  cont,
  try$,
  answer$,
} */

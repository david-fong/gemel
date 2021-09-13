import '../node.dart';

///
abstract class Type {
  /// Check if [other] can be treated as [this].
  bool accepts(Type other);
}

typedef TypeAliasId = int;

///
class TypeAlias extends Explainable {
  TypeAliasId id;
  TypeAlias(this.id);
}

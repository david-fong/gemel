import '../node.dart';
import 'vocab.dart';

enum TypeKind { action, classObj, traitObj }

/// low-level types
/// primitives, arrays/buffers, actions, trait objects,

///
abstract class Type {
  /// Check if [other] can be treated as [this].
  bool accepts(Type other);
}

typedef TypeAliasId = int;

///
class TypeAlias with Explainable {
  final TypeAliasId id;
  final Name name;
  Type type;

  TypeAlias(
    this.id, {
    required this.name,
    required this.type,
  });
}

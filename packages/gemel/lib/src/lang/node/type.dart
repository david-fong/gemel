import '../node.dart';
import 'vocab.dart';

enum TypeKind { action, classObj, traitObj }

/// low-level types
/// primitives, arrays/buffers, actions, trait objects,

///
abstract class Type {
  /// Check if [other] can be treated as [this].
  bool acceptsType(Type other);
}

typedef TypeParamId = int;

/// See Kotlin's invariance/covariance mechanism.
enum TypeParamFlow {
  /// Bans answering `T`s.
  /// Allows `Class<BaseT>` to be used as a `Class<DerivedT>`.
  inputsOnly,

  /// Bans taking `T`s as inputs.
  /// Allows `Class<DerivedT>` to be used as a `Class<BaseT>`
  answersOnly,

  /// Allows taking as inputs and answering `T`s.
  /// `Class<DerivedT>` and `Class<BaseT>` are incompatible in both directions.
  either,
}

/// AKA Generic parameter
class TypeParam implements Type {
  final TypeParamId id;
  final Name name;
  Type type;
  TypeParamFlow flow;

  TypeParam(
    this.id, {
    required this.name,
    required this.type,
    required this.flow,
  });

  @override
  bool acceptsType(final Type other) {
    throw UnimplementedError(); // TODO
  }
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

///
// TODO where to put this?
enum Id {
  nothing,
  bit,
  u08,
  u16,
  u32,
  u64,
  i08,
  i16,
  i32,
  i64,
  f32,
  f64,
  text,
  array,
  list,
  set,
  dict,
  fn,
  enum$,
  object,
}

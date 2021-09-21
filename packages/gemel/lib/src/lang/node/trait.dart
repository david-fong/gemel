import '../node.dart';
import 'vocab.dart';
import 'type.dart';
import 'action.dart';
import 'class.dart';

typedef TraitId = int;

///
class Trait with Explainable implements Type {
  final TraitId id;
  final Name name;
  final List<TypeParam> typeParams;
  final List<TraitRef> includedTraits;
  final List<ActionType> actions;

  Trait(
    this.id, {
    required this.name,
    required this.typeParams,
    required this.includedTraits,
    required this.actions,
  });

  @override
  bool acceptsType(final Type other) {
    if (other is Trait) {
      if (other == this) {
        return true;
      }
      if (other.actions.isEmpty &&
          actions.isEmpty &&
          other.includedTraits.every(
              (oit) => includedTraits.any((it) => it.acceptsType(oit)))) {
        return true;
      }
      return other.includedTraits.any((oit) => acceptsType(oit));
    } else if (other is Class) {
      if (actions.isEmpty &&
          other.traits.every(
              (oit) => includedTraits.any((it) => it.acceptsType(oit.trait)))) {
        return true;
      }
      return other.traits.any((ti) => acceptsType(ti.trait));
    }
    return false; // TODO what about union / other composed types? Will those even be supported?
  }

  /// Returns true if [other] is included in [this].
  /// Returns false if including [other] would create a cycle.
  // TODO is a cycle even a bad thing to have? Or is it okay and just more work to properly handle?
  // these are traits; not embedded classes. I guess it would just mean handling cycles in [acceptsType].
  bool includeTrait(final TraitRef other) {
    if (other.acceptsType(this)) {
      return false; // Prevent
    }
    if (acceptsType(other)) {
      return true; // already includes it.
    }
    includedTraits.add(other);
    return true;
  }
}

///
class TraitRef implements Type {
  TraitId traitId;
  // TODO specializations of typeParams.

  TraitRef(this.traitId);

  @override
  bool acceptsType(final Type other) {
    throw UnimplementedError(); // TODO
  }
}

import '../node.dart';
import 'vocab.dart';
import 'action.dart';
import 'trait.dart';
import 'type.dart';
import 'var.dart';

typedef ClassId = int;

///
class Class with Explainable implements Type {
  final ClassId id;
  int zoneId;
  final Name name;

  final List<TypeParam> typeInputs;

  _ClassEmbedderRequirements? embedder;

  final List<ClassId> embedded;

  final List<ClassPart> parts;

  /// Use traits instead for abstract or overrideable methods.
  final List<ClassAction> actions;

  final List<ClassTraitImpl> traits;

  Class(
    this.id, {
    required this.zoneId,
    required this.name,
    required this.typeInputs,
    required this.embedded,
    required this.parts,
    required this.actions,
    required this.traits,
  });

  bool get hasIncompleteTraits {
    throw UnimplementedError(); // TODO
  }

  @override
  bool acceptsType(final Type other) {
    throw UnimplementedError(); // TODO
  }
}

///
class _ClassEmbedderRequirements {
  List<ClassId> embeds;
  _ClassEmbedderRequirements({
    required this.embeds,
  });
}

typedef ClassPartId = int;

/// left character is for public, middle for protected, right for private.
enum ClassPartAccess { hhr, hhw, hrr, hrw, hww, rrr, rrw, rww, www }

///
class ClassPart {
  final ClassPartId id;
  final Name name;
  ClassPartAccess access;
  Type type;

  ClassPart(
    this.id, {
    required this.name,
    required this.access,
    required this.type,
  });
}

typedef ClassActionId = int;

enum ClassActionAccess { hhc, hcc, ccc }

///
class ClassAction {
  final ClassActionId id;
  final Name name;
  final ActionType type;
  ClassActionAccess access;

  /// See C++'s "friend" mechanism.
  final List<Object>
      accessSpecialCases; // TODO how to index to other things? classes, actions, class actions, etc

  ClassAction(
    this.id, {
    required this.name,
    required this.type,
    required this.access,
    required this.accessSpecialCases,
  });
}

///
class ClassTraitImpl {
  final Trait trait;
  bool get isFullyImplmented {
    throw UnimplementedError(); // TODO
  }

  ClassTraitImpl(this.trait);
}

///
class ClassTypeRef implements Type {
  final ClassId classId;
  List<Type> typeInputs;

  ClassTypeRef({
    required this.classId,
    required this.typeInputs,
  });
  @override
  bool acceptsType(final Type other) {
    // TODO: implement test
    throw UnimplementedError();
  }
}

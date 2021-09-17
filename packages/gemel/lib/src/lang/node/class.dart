import '../node.dart';
import 'vocab.dart';
import 'action.dart';
import 'trait.dart';
import 'type.dart';
import 'var.dart';

typedef ClassId = int;

///
class Class with Explainable {
  final ClassId id;
  int zoneId;
  final Name name;
  Type type;

  final List<Type> typeInputs;

  _ClassEmbedderRequirements? embedder;

  bool get hasIncompleteTraits;

  final List<ClassId> embedded;

  final List<ClassPart> parts;

  /// Use traits instead for abstract or overrideable methods.
  final List<ClassAction> actions;

  final List<ClassTraitImpl> traits;

  Class(
    this.id, {
    required this.zoneId,
    required this.name,
    required this.type,
    required this.typeInputs,
    required this.embedded,
    required this.parts,
    required this.actions,
    required this.traits,
  });
}

///
class _ClassEmbedderRequirements {
  List<ClassId> embeds;
  _ClassEmbedderRequirements({
    required this.embeds,
  });
}

/// left character is for public, middle for protected, right for private.
enum ClassPartAccess { hhr, hhw, hrr, hrw, hww, rrr, rrw, rww, www }

///
class ClassPart {
  final VariableId id;
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

enum ClassActionAccess { hhc, hcc, ccc }

///
class ClassAction extends Action {
  ClassActionAccess access;

  ClassAction({
    required this.access,
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
// TODO this implementation doesn't match the way Action is doing things...
class ClassType extends Type {
  final ClassId classId;
  List<Type> typeInputs;

  ClassType({
    required this.classId,
    required this.typeInputs,
  });
  @override
  bool accepts(Type other) {
    // TODO: implement test
    throw UnimplementedError();
  }
}

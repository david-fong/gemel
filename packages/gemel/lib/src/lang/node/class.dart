import '../node.dart';
import 'func.dart';
import 'trait.dart';
import 'type.dart';
import 'var.dart';

typedef ClassId = int;

///
class Class extends Explainable {
  final ClassId id;
  int zoneId;

  final List<Type> typeInputs;

  _ClassEmbedderRequirements? embedder;

  bool get hasIncompleteTraits;

  final List<ClassId> embedded;

  final List<ClassPart> parts;

  /// Use traits instead for abstract or overrideable methods.
  final List<ClassAction> actions;

  final List<ClassTraitImpl> traits;

  Class({
    required this.id,
    required this.zoneId,
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
  List<TraitId> hasTraits;
}

enum ClassPartAccess {
  hide,
  readonly,
  readWrite,
}

///
class ClassPart extends Variable {
  ClassPartAccess access;

  ClassPart() : super();
}

///
class ClassAction extends Action {}

///
class ClassTraitImpl {
  final Trait trait;

  ClassTraitImpl(this.trait);
}

///
class ClassType extends Type {
  @override
  bool accepts(Type other) {
    // TODO: implement test
    throw UnimplementedError();
  }
}

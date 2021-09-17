import '../node.dart';
import 'vocab.dart';
import 'type.dart';
import 'action.dart';

///
class TraitTypeDef extends Type {
  final List<ActionTypeDef> actions;

  TraitTypeDef(this.actions);

  @override
  bool accepts(Type other) {
    // TODO: implement accepts
    throw UnimplementedError();
  }
}

typedef TraitId = int;

///
class Trait with Explainable {
  final TraitId id;
  final Name name;
  final TraitTypeDef type;

  Trait(
    this.id, {
    required this.name,
    required this.type,
  });
}

///
class TraitTypeRef extends Type {
  TraitId traitId;
  TraitTypeRef(this.traitId);

  @override
  bool accepts(Type other) {
    // TODO: implement accepts
    throw UnimplementedError();
  }
}

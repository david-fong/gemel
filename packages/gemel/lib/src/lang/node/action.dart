import '../node.dart';
import 'vocab.dart';
import 'type.dart';
import 'var.dart';

typedef ActionParamId = int;

///
class ActionParams with Explainable {
  /// Setting to null allows for "destructuring" syntax.
  final Name? name;
  final Type type;

  ActionParams({
    required this.name,
    required this.type,
  });
}

///
class ActionTypeDef extends Type {
  final Type answerType;
  final ActionParams params;

  ActionTypeDef({
    required this.answerType,
    required this.params,
  });

  @override
  bool accepts(Type other) =>
      other is ActionTypeDef &&
      answerType.accepts(other.answerType) &&
      params.type.accepts(other.params.type);
}

typedef ActionId = int;

///
class Action with Explainable {
  final ActionId id;
  final Name name;
  ActionTypeDef type;

  Action(
    this.id, {
    required this.name,
    required this.type,
  });
}

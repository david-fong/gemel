import '../explainer.dart';
import 'vocab.dart';
import 'type.dart';

typedef ActionParamId = int;

///
class ActionParams with Explainable {
  /// Set to [Null] for "destructuring" syntax.
  final Name? name;
  Type type;
  bool reassignable;

  ActionParams({
    required this.name,
    required this.type,
    this.reassignable = false,
  });
}

///
class ActionType with Type {
  final List<TypeParam> typeParams;
  final Type answerType;
  final ActionParams params;

  ActionType({
    required this.typeParams,
    required this.answerType,
    required this.params,
  });

  @override
  bool acceptsType(final Type other) =>
      other is ActionType &&
      answerType.acceptsType(other.answerType) &&
      params.type.acceptsType(other.params.type);
}

typedef ActionId = int;

///
class ActionBody {}

///
class Action with Explainable {
  final ActionId id;
  final Name name;
  final ActionType type;
  final ActionBody? body;

  Action(
    this.id, {
    required this.name,
    required this.type,
    required this.body,
  });
}

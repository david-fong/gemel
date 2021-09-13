import '../node.dart';
import 'type.dart';
import 'var.dart';

typedef FuncId = int;

///
class Action extends Explainable {
  FuncId id;
  ActionType type;
}

class ActionType extends Type {
  final Type answerType;
  final List<Variable> params;

  @override
  bool accepts(Type other) => other is ActionType
    && answerType.accepts(other.answerType)
    && params.length == other.params.length
    && other.params.every((otherParam) => );
}

typedef ActionParamId = int;

///
class ActionParam extends Explainable {
  final ActionParamId id;
  Name

  ActionParam(this.id);
}

import '../explainer.dart';
import 'vocab.dart';
import 'type.dart';

typedef VariableId = int;

///
class Variable with Explainable {
  final VariableId id;
  final Name name;
  Type type;
  bool reassignable;

  Variable(
    this.id, {
    required this.name,
    required this.type,
    this.reassignable = false,
  });
}

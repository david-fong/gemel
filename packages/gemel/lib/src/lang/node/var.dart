import '../node.dart';
import 'vocab.dart';
import 'type.dart';

typedef VariableId = int;

///
class Variable with Explainable {
  final VariableId id;
  final Name name;
  bool reassignable;
  Type type;

  Variable(
    this.id, {
    required this.name,
    required this.reassignable,
    required this.type,
  });
}

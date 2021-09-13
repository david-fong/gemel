import 'type.dart';
import 'vocab.dart';

typedef VariableId = int;

///
class Variable {
  final VariableId id;
  final Name name;
  final bool reassignable;
  final Type type;

  Variable({
    required this.id,
    required this.name,
    required this.reassignable,
    required this.type,
  });
}

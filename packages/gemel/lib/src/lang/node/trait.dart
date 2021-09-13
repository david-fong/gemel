import '../node.dart';
import 'func.dart';

typedef TraitId = int;

///
class Trait extends Explainable {
  final TraitId id;
  final List<ActionType> actions;
  Trait({
    required this.id,
    required this.actions,
  });
}

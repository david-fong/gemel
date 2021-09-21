import '../node.dart';
import 'vocab.dart';
import 'type.dart';

typedef EnumId = int;

///
class Enum with Explainable implements Type {
  final EnumId id;
  final Name name;

  Enum(
    this.id, {
    required this.name,
  });

  @override
  bool acceptsType(Type other) {
    throw UnimplementedError(); // TODO
  }
}

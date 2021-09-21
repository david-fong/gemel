import '../node.dart';
import 'vocab.dart';
import 'enum.dart';

enum ZoneAccess {
  todo // TODO
}

///
class Zone with Explainable {
  /// uniquity-by-package helpful to prevent updating many referers when moving.
  /// use a global id to prevent needing to id other contained things that don't
  /// have global ids by a variable-length list of zone path parts.
  final int id;
  final Name name;
  ZoneAccess access;
  ZoneChildRules childRules;

  Zone(
    this.id, {
    required this.name,
    required this.access,
    required this.childRules,
  });
}

///
abstract class ZoneChildRules {}

///
class ZoneChildRulesForEachEnum {
  EnumId in$;
  ZoneChildRules follow;

  ZoneChildRulesForEachEnum({
    required this.in$,
    required this.follow,
  });
}

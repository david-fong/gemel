///
class DisplayRules {
  int indentWidth;
  int pageWidth;
  _Casings casings;
  TrailingListDelimiter trailingListDelimiter;
  _LineBreakings lineBreakings;

  DisplayRules({
    required this.indentWidth,
    required this.pageWidth,
    required this.casings,
    required this.trailingListDelimiter,
    required this.lineBreakings,
  });
}

enum _CasingSeparator { none, dash, underscore }
enum _CasingCaps { none, camel, pascal, all }

///
class Casing {
  final _CasingSeparator separator;
  final _CasingCaps caps;
  const Casing(this.separator, this.caps);
  @override
  String toString() {
    const sepToString = {
      _CasingSeparator.none: "",
      _CasingSeparator.dash: "-",
      _CasingSeparator.underscore: "_",
    };
    const capsToString = {
      _CasingCaps.none: "aabbcc",
      _CasingCaps.camel: "aaBbCc",
      _CasingCaps.pascal: "AaBbCc",
      _CasingCaps.all: "AABBCC",
    };
    return sepToString[separator]! + capsToString[caps]!;
  }
}

///
class _Casings {
  Casing folder;
  Casing variable;
  Casing enum$;
  Casing enumMember;
  Casing type;
  _Casings({
    required this.folder,
    required this.variable,
    required this.enum$,
    required this.enumMember,
    required this.type,
  });
}

///
enum TrailingListDelimiter { beforeNewline, never, always }

///
class _LineBreakings {
  bool beforeOpeningBlock;
  _LineBreakings({
    required this.beforeOpeningBlock,
  });
}

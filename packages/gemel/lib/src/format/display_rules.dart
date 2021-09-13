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

enum _CasingSeparator {
  none,
  dash,
  underscore,
}
enum _CastingCaps {
  none,
  camel,
  pascal,
  all,
}

///
class Casing {
  final _CasingSeparator separator;
  final _CastingCaps caps;
  const Casing(this.separator, this.caps);
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
enum TrailingListDelimiter {
  beforeNewline,
  never,
  always,
}

///
class _LineBreakings {
  bool beforeOpeningBlock;
  _LineBreakings({
    required this.beforeOpeningBlock,
  });
}

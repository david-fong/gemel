import 'dart:io';
import 'package:path/path.dart' as p;

String generate(final int howMany) {
  final _nums = List.generate(howMany, (i) => i + 1, growable: false);
  String join(String j, String Function(int i) map) => _nums.map(map).join(j);
  String list(String prefix) => join(", ", (n) => "$prefix$n");
  return """

class VarSub${howMany}Builder<${list("T")}, C> extends StatefulWidget {
  const VarSub${howMany}Builder({
    Key? key,
    ${join("\n    ", (n) => "required this.var$n,")}
    required this.builder,
    this.children,
  }) : super(key: key);

  ${join("\n  ", (n) => "final Var4Widget<T$n> var$n;")}
  final Widget Function(BuildContext context, ${join(", ", (n) => "T$n v$n")}, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarSub${howMany}BuilderState<${list("T")}, C>();
}

class _VarSub${howMany}BuilderState<${list("T")}, C> extends State<VarSub${howMany}Builder<${list("T")}, C>> {
  ${join("\n  ", (n) => "late _VarSub4Widget<T$n> _sub$n;")}
  @override
  void initState() {
    super.initState();
    ${join("\n    ", (n) => "_sub$n = widget.var$n.sub(_onVarChange);")}
  }

  @override
  void didUpdateWidget(VarSub${howMany}Builder<${list("T")}, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
${join("", (n) => """
    if (oldWidget.var$n != widget.var$n) {
      oldWidget.var$n.unsub(_sub$n);
      _sub$n = widget.var$n.sub(_onVarChange);
    }
""")}  }

  @override
  void dispose() {
    ${join("\n    ", (n) => "widget.var$n.unsub(_sub$n);")}
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, ${join(", ", (n) => "widget.var$n.val()")}, widget.children);
}
""";
// The option of chaining extension _almost_ works. It isn't clean because it
// requires overriding the builder field of the State classes. Perhaps I'll find
// a solution in the future. For now, this should work fine.
}

void main() {
  final fs = File(p.join(
    p.dirname(Platform.script.toFilePath()),
    "./widget_var.header.dart",
  ))
      .copySync(p.join(
        p.dirname(Platform.script.toFilePath()),
        "../lib/util/widget_var.dart",
      ))
      .openWrite(mode: FileMode.writeOnlyAppend);

  for (var n = 1; n <= 5; n++) {
    fs.write(generate(n));
  }
  fs.close();
}

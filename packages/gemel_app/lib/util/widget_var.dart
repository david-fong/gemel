import 'dart:collection';
import 'package:flutter/widgets.dart';

///
class _VarRef4Widget<T> {
  _VarRef4Widget(this.scheduleBuild, {required this.index});
  final VoidCallback scheduleBuild;
  int index;
}

/// Specialized look-alike to [ValueNotifier].
class Var4Widget<T> {
  Var4Widget(this.val);
  final T Function() val;

  /// Needs fast insertion and removal. Order doesn't matter.
  /// Entries will not be contained in any other list instance.
  /// Could have used [LinkedList], but this is even better.
  List<_VarRef4Widget?> _subs = List.filled(0, null);
  int _numSubs = 0;

  _VarRef4Widget<T> sub(VoidCallback scheduleBuild) {
    if (_numSubs == 0) {
      _subs = List.filled(1, null);
    } else if (_numSubs == _subs.length) {
      final old = _subs;
      _subs = List.filled(_numSubs * 2, null);
      for (var i = 0; i < _numSubs; i++) {
        _subs[i] = old[i];
      }
    }
    final sub = _VarRef4Widget<T>(scheduleBuild, index: _numSubs);
    _subs[_numSubs++] = sub;
    return sub;
  }

  void unsub(_VarRef4Widget<T> sub) {
    assert(identical(sub, _subs[sub.index]));
    _subs[sub.index] = _subs[--_numSubs];
    _subs[sub.index]!.index = sub.index;
    _subs[_numSubs] = null;
    if (_numSubs <= _subs.length / 2) {
      final old = _subs;
      _subs = List.filled(_numSubs, null);
      for (var i = 0; i < _numSubs; i++) {
        _subs[i] = old[i];
      }
    }
  }

  void notify() {
    for (var i = 0; i < _numSubs; i++) {
      _subs[i]?.scheduleBuild();
    }
  }
}

class VarRef1Builder<T1, C> extends StatefulWidget {
  const VarRef1Builder({
    Key? key,
    required this.var1,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Widget Function(BuildContext context, T1 v1, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarRef1BuilderState<T1, C>();
}

class _VarRef1BuilderState<T1, C> extends State<VarRef1Builder<T1, C>> {
  late _VarRef4Widget<T1> _sub1;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarRef1Builder<T1, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.var1 != widget.var1) {
      oldWidget.var1.unsub(_sub1);
      _sub1 = widget.var1.sub(_onVarChange);
    }

  }

  @override
  void dispose() {
    widget.var1.unsub(_sub1);
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.var1.val(), widget.children);
}

class VarRef2Builder<T1, T2, C> extends StatefulWidget {
  const VarRef2Builder({
    Key? key,
    required this.var1,
    required this.var2,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Var4Widget<T2> var2;
  final Widget Function(BuildContext context, T1 v1, T2 v2, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarRef2BuilderState<T1, T2, C>();
}

class _VarRef2BuilderState<T1, T2, C> extends State<VarRef2Builder<T1, T2, C>> {
  late _VarRef4Widget<T1> _sub1;
  late _VarRef4Widget<T2> _sub2;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarRef2Builder<T1, T2, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.var1 != widget.var1) {
      oldWidget.var1.unsub(_sub1);
      _sub1 = widget.var1.sub(_onVarChange);
    }
    if (oldWidget.var2 != widget.var2) {
      oldWidget.var2.unsub(_sub2);
      _sub2 = widget.var2.sub(_onVarChange);
    }

  }

  @override
  void dispose() {
    widget.var1.unsub(_sub1);
    widget.var2.unsub(_sub2);
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.var1.val(), widget.var2.val(), widget.children);
}

class VarRef3Builder<T1, T2, T3, C> extends StatefulWidget {
  const VarRef3Builder({
    Key? key,
    required this.var1,
    required this.var2,
    required this.var3,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Var4Widget<T2> var2;
  final Var4Widget<T3> var3;
  final Widget Function(BuildContext context, T1 v1, T2 v2, T3 v3, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarRef3BuilderState<T1, T2, T3, C>();
}

class _VarRef3BuilderState<T1, T2, T3, C> extends State<VarRef3Builder<T1, T2, T3, C>> {
  late _VarRef4Widget<T1> _sub1;
  late _VarRef4Widget<T2> _sub2;
  late _VarRef4Widget<T3> _sub3;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
    _sub3 = widget.var3.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarRef3Builder<T1, T2, T3, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.var1 != widget.var1) {
      oldWidget.var1.unsub(_sub1);
      _sub1 = widget.var1.sub(_onVarChange);
    }
    if (oldWidget.var2 != widget.var2) {
      oldWidget.var2.unsub(_sub2);
      _sub2 = widget.var2.sub(_onVarChange);
    }
    if (oldWidget.var3 != widget.var3) {
      oldWidget.var3.unsub(_sub3);
      _sub3 = widget.var3.sub(_onVarChange);
    }

  }

  @override
  void dispose() {
    widget.var1.unsub(_sub1);
    widget.var2.unsub(_sub2);
    widget.var3.unsub(_sub3);
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.var1.val(), widget.var2.val(), widget.var3.val(), widget.children);
}

class VarRef4Builder<T1, T2, T3, T4, C> extends StatefulWidget {
  const VarRef4Builder({
    Key? key,
    required this.var1,
    required this.var2,
    required this.var3,
    required this.var4,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Var4Widget<T2> var2;
  final Var4Widget<T3> var3;
  final Var4Widget<T4> var4;
  final Widget Function(BuildContext context, T1 v1, T2 v2, T3 v3, T4 v4, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarRef4BuilderState<T1, T2, T3, T4, C>();
}

class _VarRef4BuilderState<T1, T2, T3, T4, C> extends State<VarRef4Builder<T1, T2, T3, T4, C>> {
  late _VarRef4Widget<T1> _sub1;
  late _VarRef4Widget<T2> _sub2;
  late _VarRef4Widget<T3> _sub3;
  late _VarRef4Widget<T4> _sub4;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
    _sub3 = widget.var3.sub(_onVarChange);
    _sub4 = widget.var4.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarRef4Builder<T1, T2, T3, T4, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.var1 != widget.var1) {
      oldWidget.var1.unsub(_sub1);
      _sub1 = widget.var1.sub(_onVarChange);
    }
    if (oldWidget.var2 != widget.var2) {
      oldWidget.var2.unsub(_sub2);
      _sub2 = widget.var2.sub(_onVarChange);
    }
    if (oldWidget.var3 != widget.var3) {
      oldWidget.var3.unsub(_sub3);
      _sub3 = widget.var3.sub(_onVarChange);
    }
    if (oldWidget.var4 != widget.var4) {
      oldWidget.var4.unsub(_sub4);
      _sub4 = widget.var4.sub(_onVarChange);
    }

  }

  @override
  void dispose() {
    widget.var1.unsub(_sub1);
    widget.var2.unsub(_sub2);
    widget.var3.unsub(_sub3);
    widget.var4.unsub(_sub4);
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.var1.val(), widget.var2.val(), widget.var3.val(), widget.var4.val(), widget.children);
}

class VarRef5Builder<T1, T2, T3, T4, T5, C> extends StatefulWidget {
  const VarRef5Builder({
    Key? key,
    required this.var1,
    required this.var2,
    required this.var3,
    required this.var4,
    required this.var5,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Var4Widget<T2> var2;
  final Var4Widget<T3> var3;
  final Var4Widget<T4> var4;
  final Var4Widget<T5> var5;
  final Widget Function(BuildContext context, T1 v1, T2 v2, T3 v3, T4 v4, T5 v5, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarRef5BuilderState<T1, T2, T3, T4, T5, C>();
}

class _VarRef5BuilderState<T1, T2, T3, T4, T5, C> extends State<VarRef5Builder<T1, T2, T3, T4, T5, C>> {
  late _VarRef4Widget<T1> _sub1;
  late _VarRef4Widget<T2> _sub2;
  late _VarRef4Widget<T3> _sub3;
  late _VarRef4Widget<T4> _sub4;
  late _VarRef4Widget<T5> _sub5;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
    _sub3 = widget.var3.sub(_onVarChange);
    _sub4 = widget.var4.sub(_onVarChange);
    _sub5 = widget.var5.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarRef5Builder<T1, T2, T3, T4, T5, C> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.var1 != widget.var1) {
      oldWidget.var1.unsub(_sub1);
      _sub1 = widget.var1.sub(_onVarChange);
    }
    if (oldWidget.var2 != widget.var2) {
      oldWidget.var2.unsub(_sub2);
      _sub2 = widget.var2.sub(_onVarChange);
    }
    if (oldWidget.var3 != widget.var3) {
      oldWidget.var3.unsub(_sub3);
      _sub3 = widget.var3.sub(_onVarChange);
    }
    if (oldWidget.var4 != widget.var4) {
      oldWidget.var4.unsub(_sub4);
      _sub4 = widget.var4.sub(_onVarChange);
    }
    if (oldWidget.var5 != widget.var5) {
      oldWidget.var5.unsub(_sub5);
      _sub5 = widget.var5.sub(_onVarChange);
    }

  }

  @override
  void dispose() {
    widget.var1.unsub(_sub1);
    widget.var2.unsub(_sub2);
    widget.var3.unsub(_sub3);
    widget.var4.unsub(_sub4);
    widget.var5.unsub(_sub5);
    super.dispose();
  }

  void _onVarChange() => setState(() {});

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, widget.var1.val(), widget.var2.val(), widget.var3.val(), widget.var4.val(), widget.var5.val(), widget.children);
}

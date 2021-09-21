import 'package:flutter/widgets.dart'
    show VoidCallback, Key, Widget, StatefulWidget, BuildContext, State;

/// A [_VarSub1BuilderState] recieves this upon subscribing to a [Var4Widget].
/// It must not (and does not) access any of the fields herein.
///
/// The widget's [State] must pass this to the [Var4Widget]'s [Var4Widget.unsub]
/// method when [State.dispose]ing itself.
class _VarSub4Widget<T> {
  _VarSub4Widget(this.scheduleBuild, {required this.index});

  /// The subscribing widget's [State.setState] function.
  final VoidCallback scheduleBuild;

  /// Low-level book-keeping info for [Var4Widget]'s compact subscriber list.
  int index;
}

/// Simplified look-alike to [ValueNotifier] optimized for performance and
/// efficient storage.
///
/// It is O(1) for adding and removing listeners, and O(N) for dispatching
/// notifications (where N is the number of listeners).
///
/// Note: An alternate implementation is to remove [_VarSub4Widget] and instead
/// just use the callback like [ChangeNotifier], which is more space efficient,
/// but changes removal performance to O(N). Note that [_BroadcastSubscription]
/// in dart.async gets O(1) removal via prev/next linkages.
/*
TODO it would be interesting in the future to play with the list resizing
logic to see if there are more performant threshold calculations. */
class Var4Widget<T> {
  Var4Widget(this.val);
  final T Function() val;

  /// Needs fast insertion and removal. Order doesn't matter.
  /// Entries will not be contained in any other list instance.
  /// Could have used [LinkedList], but this is even better.
  List<_VarSub4Widget?> _subs = List.filled(0, null);
  int _numSubs = 0;

  _VarSub4Widget<T> sub(VoidCallback scheduleBuild) {
    if (_numSubs == 0) {
      _subs = List.filled(1, null);
    } else if (_numSubs == _subs.length) {
      final old = _subs;
      _subs = List.filled(_numSubs * 2, null);
      for (var i = 0; i < _numSubs; i++) {
        _subs[i] = old[i];
      }
    }
    final sub = _VarSub4Widget<T>(scheduleBuild, index: _numSubs);
    _subs[_numSubs++] = sub;
    return sub;
  }

  void unsub(_VarSub4Widget<T> sub) {
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

  /// Must be called after every change to the watched variable.
  ///
  /// Unlike [ChangeNotifier.notifyListeners], the only kind of listener will
  /// be [State.setState], which frees this implementation from the complxity
  /// and space cost of handling recursive notifications or listener removals
  /// during notification.
  void notify() {
    for (var i = 0; i < _numSubs; i++) {
      _subs[i]?.scheduleBuild();
    }
  }
}

class VarSub1Builder<T1, C> extends StatefulWidget {
  const VarSub1Builder({
    Key? key,
    required this.var1,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Widget Function(BuildContext context, T1 v1, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarSub1BuilderState<T1, C>();
}

class _VarSub1BuilderState<T1, C> extends State<VarSub1Builder<T1, C>> {
  late _VarSub4Widget<T1> _sub1;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarSub1Builder<T1, C> oldWidget) {
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

class VarSub2Builder<T1, T2, C> extends StatefulWidget {
  const VarSub2Builder({
    Key? key,
    required this.var1,
    required this.var2,
    required this.builder,
    this.children,
  }) : super(key: key);

  final Var4Widget<T1> var1;
  final Var4Widget<T2> var2;
  final Widget Function(BuildContext context, T1 v1, T2 v2, C? children)
      builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarSub2BuilderState<T1, T2, C>();
}

class _VarSub2BuilderState<T1, T2, C> extends State<VarSub2Builder<T1, T2, C>> {
  late _VarSub4Widget<T1> _sub1;
  late _VarSub4Widget<T2> _sub2;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarSub2Builder<T1, T2, C> oldWidget) {
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
  Widget build(BuildContext context) => widget.builder(
      context, widget.var1.val(), widget.var2.val(), widget.children);
}

class VarSub3Builder<T1, T2, T3, C> extends StatefulWidget {
  const VarSub3Builder({
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
  final Widget Function(BuildContext context, T1 v1, T2 v2, T3 v3, C? children)
      builder;
  final C? children;

  @override
  State<StatefulWidget> createState() => _VarSub3BuilderState<T1, T2, T3, C>();
}

class _VarSub3BuilderState<T1, T2, T3, C>
    extends State<VarSub3Builder<T1, T2, T3, C>> {
  late _VarSub4Widget<T1> _sub1;
  late _VarSub4Widget<T2> _sub2;
  late _VarSub4Widget<T3> _sub3;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
    _sub3 = widget.var3.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarSub3Builder<T1, T2, T3, C> oldWidget) {
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
  Widget build(BuildContext context) => widget.builder(context,
      widget.var1.val(), widget.var2.val(), widget.var3.val(), widget.children);
}

class VarSub4Builder<T1, T2, T3, T4, C> extends StatefulWidget {
  const VarSub4Builder({
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
  final Widget Function(
      BuildContext context, T1 v1, T2 v2, T3 v3, T4 v4, C? children) builder;
  final C? children;

  @override
  State<StatefulWidget> createState() =>
      _VarSub4BuilderState<T1, T2, T3, T4, C>();
}

class _VarSub4BuilderState<T1, T2, T3, T4, C>
    extends State<VarSub4Builder<T1, T2, T3, T4, C>> {
  late _VarSub4Widget<T1> _sub1;
  late _VarSub4Widget<T2> _sub2;
  late _VarSub4Widget<T3> _sub3;
  late _VarSub4Widget<T4> _sub4;
  @override
  void initState() {
    super.initState();
    _sub1 = widget.var1.sub(_onVarChange);
    _sub2 = widget.var2.sub(_onVarChange);
    _sub3 = widget.var3.sub(_onVarChange);
    _sub4 = widget.var4.sub(_onVarChange);
  }

  @override
  void didUpdateWidget(VarSub4Builder<T1, T2, T3, T4, C> oldWidget) {
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
  Widget build(BuildContext context) => widget.builder(
      context,
      widget.var1.val(),
      widget.var2.val(),
      widget.var3.val(),
      widget.var4.val(),
      widget.children);
}

class VarSub5Builder<T1, T2, T3, T4, T5, C> extends StatefulWidget {
  const VarSub5Builder({
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
  final Widget Function(
          BuildContext context, T1 v1, T2 v2, T3 v3, T4 v4, T5 v5, C? children)
      builder;
  final C? children;

  @override
  State<StatefulWidget> createState() =>
      _VarSub5BuilderState<T1, T2, T3, T4, T5, C>();
}

class _VarSub5BuilderState<T1, T2, T3, T4, T5, C>
    extends State<VarSub5Builder<T1, T2, T3, T4, T5, C>> {
  late _VarSub4Widget<T1> _sub1;
  late _VarSub4Widget<T2> _sub2;
  late _VarSub4Widget<T3> _sub3;
  late _VarSub4Widget<T4> _sub4;
  late _VarSub4Widget<T5> _sub5;
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
  void didUpdateWidget(VarSub5Builder<T1, T2, T3, T4, T5, C> oldWidget) {
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
  Widget build(BuildContext context) => widget.builder(
      context,
      widget.var1.val(),
      widget.var2.val(),
      widget.var3.val(),
      widget.var4.val(),
      widget.var5.val(),
      widget.children);
}

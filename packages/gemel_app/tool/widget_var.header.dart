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

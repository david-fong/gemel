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
  final T Function() val;

  /// Needs fast insertion and removal. Order doesn't matter.
  /// Entries will not be contained in any other list instance.
  /// Could have used [LinkedList], but this is even better.
  List<_VarSub4Widget?> _subs;
  int _numSubs = 0;

  Var4Widget(this.val, {int initCapacity = 0})
      : _subs = List.filled(initCapacity, null);

  /// [scheduleBuild] should be a [State.setState] tearoff.
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
    if (_numSubs <= _subs.length / 4) {
      // ^use `growth_factor^2`
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

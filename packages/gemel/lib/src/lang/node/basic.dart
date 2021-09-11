

import 'package:gemel/src/lang/node.dart';

///
class Spacing extends Node {}

///
class Word extends Node {
  final int vocabId;
  final int id;
  String _value;
  String get value => _value;

  Word(this.id, this.vocabId);
}
class CompoundWord extends Node {

}

///
class WordMeaning extends Node {}

///
class Vocab extends Node {
  final List<int> word
}
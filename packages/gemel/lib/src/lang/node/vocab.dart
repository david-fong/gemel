import '../node.dart';

enum WordKind {
  noun,
  verb,
  variator, // an adjective, or noun (such as an embedder)
}

typedef WordId = int;

///
class Word extends Explainable {
  /// Foreign key to owner.
  VocabId vocabId;

  /// Primary key. Unique within package.
  final WordId id;
  WordKind kind;
  final List<Object> value;

  Word({
    required this.id,
    required this.kind,
    required this.vocabId,
    required this.value,
  });
}

typedef VocabId = int;

///
class Vocab extends Explainable {
  final VocabId id;
  final List<WordId> words;

  Vocab(this.id, this.words);
}

///
class Name {
  final List<WordId> value;

  Name(this.value);
}

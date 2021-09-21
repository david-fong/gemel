import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final var$ = 1;

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(var$ == 1, isTrue);
    });
  });
}

import 'package:kata_rover/vector.dart';
import 'package:test/test.dart';

void main() {
  test(
      'rotate vector to -90 should returns a new vector rotate by -90 with center (0,0)',
      () {
    final vector = Vector(x: 1, y: 2);
    expect(vector.rotate(-90), equals(Vector(x: 2, y: -1)));
  });
}

import 'package:kata_rover/rover.dart';
import 'package:test/test.dart';

void main() {
  test('Rover should start at the initial postion and orientation', () {
    final rover =
        Rover(position: Position(x: 1, y: 2), orientation: Orientation.NORTH);

    expect(rover.position, equals(Position(x: 1, y: 2)));
    expect(rover.orientation, equals(Orientation.NORTH));
  });
}

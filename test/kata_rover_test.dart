import 'package:kata_rover/rover.dart';
import 'package:test/test.dart';

void main() {
  test('rover should start at the initial postion and orientation', () {
    final rover =
        Rover(position: Position(x: 1, y: 2), orientation: Orientation.NORTH);

    expect(rover.position, equals(Position(x: 1, y: 2)));
    expect(rover.orientation, equals(Orientation.NORTH));
  });

  group('Orientation NORTH', () {
    test('rover oriented to north when move forward should move the rover up',
        () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.NORTH);

      rover.move(Move.FORWARD);
      expect(rover.position, equals(Position(x: 1, y: 1)));
    });

    test(
        'rover oriented to north when move backward should move the rover down',
        () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.NORTH);

      rover.move(Move.BACKWARD);
      expect(rover.position, equals(Position(x: 1, y: 3)));
    });
  });
  group('Orientation SOUTH', () {
    test('when move forward should move the rover down', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.SOUTH);

      rover.move(Move.FORWARD);
      expect(rover.position, equals(Position(x: 1, y: 3)));
    });

    test('when move backward should move the rover up', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.SOUTH);

      rover.move(Move.BACKWARD);
      expect(rover.position, equals(Position(x: 1, y: 1)));
    });
  });

  group('Orientation EAST', () {
    test('when move forward should move the rover right', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.EAST);

      rover.move(Move.FORWARD);
      expect(rover.position, equals(Position(x: 2, y: 2)));
    });

    test('when move backward should move the rover left', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.EAST);

      rover.move(Move.BACKWARD);
      expect(rover.position, equals(Position(x: 0, y: 2)));
    });
  });

  group('Orientation WEST', () {
    test('when move forward should move the rover left', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.WEST);

      rover.move(Move.FORWARD);
      expect(rover.position, equals(Position(x: 0, y: 2)));
    });

    test('when move backward should move the rover right', () {
      final rover =
          Rover(position: Position(x: 1, y: 2), orientation: Orientation.WEST);

      rover.move(Move.BACKWARD);
      expect(rover.position, equals(Position(x: 2, y: 2)));
    });
  });
}

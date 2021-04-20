import 'package:kata_rover/orientation.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:kata_rover/rover.dart';
import 'package:test/test.dart';

void main() {
  final plan = const Plan(
      minPosition: Position(x: 0, y: 0),
      maxPosition: Position(x: 10, y: 10),
      obstables: []);
  test('rover should start at the initial postion and orientation', () {
    final rover = Rover(
        position: const Position(x: 1, y: 2),
        vector: Orientation.NORTH.vector,
        plan: plan);

    expect(rover.position, equals(Position(x: 1, y: 2)));
    expect(rover.vector, equals(Orientation.NORTH.vector));
  });

  group('Orientation NORTH', () {
    test('when move forward should move the rover up', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.NORTH.vector,
          plan: plan);

      rover.execute(Command.FORWARD);
      expect(rover.position, equals(Position(x: 1, y: 1)));
    });

    test('when move backward should move the rover down', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.NORTH.vector,
          plan: plan);

      rover.execute(Command.BACKWARD);
      expect(rover.position, equals(Position(x: 1, y: 3)));
    });

    test('when move left should orientated to the WEST', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.NORTH.vector,
          plan: plan);

      rover.execute(Command.LEFT);
      expect(rover.vector, equals(Orientation.WEST.vector));
    });

    test('when move right should orientated to the EAST', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.NORTH.vector,
          plan: plan);

      rover.execute(Command.RIGHT);
      expect(rover.vector, equals(Orientation.EAST.vector));
    });
  });
  group('Orientation SOUTH', () {
    test('when move forward should move the rover down', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.SOUTH.vector,
          plan: plan);

      rover.execute(Command.FORWARD);
      expect(rover.position, equals(Position(x: 1, y: 3)));
    });

    test('when move backward should move the rover up', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.SOUTH.vector,
          plan: plan);

      rover.execute(Command.BACKWARD);
      expect(rover.position, equals(Position(x: 1, y: 1)));
    });

    test('when move left should orientated to the EAST', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.SOUTH.vector,
          plan: plan);

      rover.execute(Command.LEFT);
      expect(rover.vector, equals(Orientation.EAST.vector));
    });

    test('when move right should orientated to the WEST', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.SOUTH.vector,
          plan: plan);

      rover.execute(Command.RIGHT);
      expect(rover.vector, equals(Orientation.WEST.vector));
    });
  });

  group('Orientation EAST', () {
    test('when move forward should move the rover right', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.EAST.vector,
          plan: plan);

      rover.execute(Command.FORWARD);
      expect(rover.position, equals(Position(x: 2, y: 2)));
    });

    test('when move backward should move the rover left', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.EAST.vector,
          plan: plan);

      rover.execute(Command.BACKWARD);
      expect(rover.position, equals(Position(x: 0, y: 2)));
    });

    test('when move left should orientated to the NORTH', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.EAST.vector,
          plan: plan);

      rover.execute(Command.LEFT);
      expect(rover.vector, equals(Orientation.NORTH.vector));
    });

    test('when move right should orientated to the SOUTH', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.EAST.vector,
          plan: plan);

      rover.execute(Command.RIGHT);
      expect(rover.vector, equals(Orientation.SOUTH.vector));
    });
  });

  group('Orientation WEST', () {
    test('when move forward should move the rover left', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.WEST.vector,
          plan: plan);

      rover.execute(Command.FORWARD);
      expect(rover.position, equals(Position(x: 0, y: 2)));
    });

    test('when move backward should move the rover right', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.WEST.vector,
          plan: plan);

      rover.execute(Command.BACKWARD);
      expect(rover.position, equals(Position(x: 2, y: 2)));
    });

    test('when move left should orientated to the SOUTH', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.WEST.vector,
          plan: plan);

      rover.execute(Command.LEFT);
      expect(rover.vector, equals(Orientation.SOUTH.vector));
    });

    test('when move right should orientated to the NORTH', () {
      final rover = Rover(
          position: const Position(x: 1, y: 2),
          vector: Orientation.WEST.vector,
          plan: plan);

      rover.execute(Command.RIGHT);
      expect(rover.vector, equals(Orientation.NORTH.vector));
    });
  });

  test('when rover go to an obstacle stop the rover', () {
    final rover = Rover(
        position: Position(x: 1, y: 2),
        vector: Orientation.SOUTH.vector,
        plan: const Plan(
            minPosition: Position(x: 0, y: 0),
            maxPosition: Position(x: 10, y: 10),
            obstables: [Position(x: 1, y: 3)]));

    rover.execute(Command.FORWARD);
    expect(rover.position, equals(Position(x: 1, y: 2)));
  });
}

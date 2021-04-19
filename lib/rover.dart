import 'package:kata_rover/position.dart';
import 'package:kata_rover/vector.dart';

enum Command { FORWARD, BACKWARD, LEFT, RIGHT }

class Rover {
  Rover({required this.position, required this.vector});

  Position position;
  Vector vector;

  void execute(Command move) {
    switch (move) {
      case Command.FORWARD:
        _move(vector);
        break;
      case Command.BACKWARD:
        _move(vector.reversed);
        break;
      case Command.LEFT:
        _rotate(-90);
        break;
      case Command.RIGHT:
        _rotate(90);
        break;
    }
  }

  void _move(Vector vector) {
    position = Position(x: position.x + vector.x, y: position.y + vector.y);
  }

  void _rotate(int degrees) {
    vector = vector.rotate(degrees);
  }
}

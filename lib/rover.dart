class Rover {
  Rover({required this.position, required this.orientation});

  Position position;
  Orientation orientation;

  void move(Move move) {
    switch (move) {
      case Move.FORWARD:
        _moveForward();
        break;
      case Move.BACKWARD:
        _moveBackward();
        break;
    }
  }

  void _moveForward() {
    switch (orientation) {
      case Orientation.NORTH:
        position = Position(x: position.x, y: position.y - 1);
        break;
      case Orientation.EAST:
        position = Position(x: position.x + 1, y: position.y);
        break;
      case Orientation.SOUTH:
        position = Position(x: position.x, y: position.y + 1);
        break;
      case Orientation.WEST:
        position = Position(x: position.x - 1, y: position.y);
        break;
    }
  }

  void _moveBackward() {
    switch (orientation) {
      case Orientation.NORTH:
        position = Position(x: position.x, y: position.y + 1);
        break;
      case Orientation.EAST:
        position = Position(x: position.x - 1, y: position.y);
        break;
      case Orientation.SOUTH:
        position = Position(x: position.x, y: position.y - 1);
        break;
      case Orientation.WEST:
        position = Position(x: position.x + 1, y: position.y);
        break;
    }
  }
}

enum Move { FORWARD, BACKWARD }

enum Orientation { NORTH, EAST, SOUTH, WEST }

class Position {
  Position({required this.x, required this.y});
  final int x;
  final int y;

  bool equals(Object position) {
    return position is Position && position.x == x && position.y == y;
  }

  @override
  String toString() => '($x, $y)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

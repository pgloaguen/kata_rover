class Rover {
  Rover({required this.position, required this.orientation});

  final Position position;
  final Orientation orientation;
}

enum Orientation { NORTH, EAST, SOUTH, WEST }

class Position {
  Position({required this.x, required this.y});
  final int x;
  final int y;

  bool equals(Object position) {
    return position is Position && position.x == x && position.y == y;
  }

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

import 'package:kata_rover/vector.dart';

enum Orientation { NORTH, EAST, SOUTH, WEST }

extension OrientationVector on Orientation {
  Vector get vector {
    switch (this) {
      case Orientation.NORTH:
        return Vector(x: 0, y: -1);
      case Orientation.EAST:
        return Vector(x: 1, y: 0);
      case Orientation.SOUTH:
        return Vector(x: 0, y: 1);
      case Orientation.WEST:
        return Vector(x: -1, y: 0);
    }
  }
}

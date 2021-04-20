import 'package:kata_rover/orientation.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:kata_rover/rover.dart';
import 'package:kata_rover/vector.dart';

class Pen {
  final OBSTACLE = 'x';
  final EMPTY = '-';
  final ROVER = Map<Vector, String>.fromIterable(Orientation.values,
      key: (o) => (o as Orientation).vector,
      value: (o) {
        String? value;
        switch (o) {
          case Orientation.NORTH:
            value = '^';
            break;
          case Orientation.EAST:
            value = '>';
            break;
          case Orientation.SOUTH:
            value = 'v';
            break;
          case Orientation.WEST:
            value = '<';
            break;
        }
        return value!;
      });

  String draw(Plan plan, {Rover? rover}) {
    var draw = '';
    for (var y = plan.minPosition.y; y <= plan.maxPosition.y; y++) {
      draw += ' ';
      for (var x = plan.minPosition.x; x <= plan.maxPosition.x; x++) {
        if (plan.obstables.contains(Position(x: x, y: y))) {
          draw += OBSTACLE;
        } else if (rover?.position == Position(x: x, y: y)) {
          draw += ROVER[rover!.vector]!;
        } else {
          draw += EMPTY;
        }
        draw += ' ';
      }
      draw += '\n';
    }
    return draw;
  }
}

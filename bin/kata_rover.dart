import 'package:kata_rover/console_painter.dart';
import 'package:kata_rover/orientation.dart';
import 'package:kata_rover/pen.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:kata_rover/rover.dart';
import 'package:console/console.dart';

void main(List<String> args) async {
  final plan = const Plan(
      minPosition: Position(x: 0, y: 0),
      maxPosition: Position(x: 10, y: 9),
      obstables: <Position>[
        Position(x: 5, y: 5),
      ]);

  final rover = Rover(
      position: const Position(x: 4, y: 5),
      vector: Orientation.NORTH.vector,
      plan: plan);

  final pen = Pen();

  final painter = Painter.console(pen: pen, plan: plan, rover: rover);

  Keyboard.init();

  painter.paint();

  Keyboard.bindKey('up').listen((_) {
    rover.execute(Command.FORWARD);
    painter.paint();
  });

  Keyboard.bindKey('down').listen((_) {
    rover.execute(Command.BACKWARD);
    painter.paint();
  });

  Keyboard.bindKey('left').listen((_) {
    rover.execute(Command.LEFT);
    painter.paint();
  });

  Keyboard.bindKey('right').listen((_) {
    rover.execute(Command.RIGHT);
    painter.paint();
  });
}

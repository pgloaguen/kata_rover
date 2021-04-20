import 'package:console/console.dart';
import 'package:kata_rover/pen.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/rover.dart';

abstract class Painter {
  factory Painter.console(
          {required Pen pen, required Plan plan, required Rover rover}) =>
      _ConsolePainter(pen: pen, plan: plan, rover: rover);

  void paint();
}

class _ConsolePainter implements Painter {
  _ConsolePainter(
      {required this.pen, required this.plan, required this.rover}) {
    Console.init();
  }

  final Pen pen;
  final Plan plan;
  final Rover rover;
  String? lastMessage;

  @override
  void paint() {
    if (lastMessage != null) {
      Console.moveCursorUp(lastMessage!.split('\n').length - 1);
      Console.moveCursorBack(lastMessage!.split('\n')[0].length);
    }
    final message = pen.draw(plan, rover: rover);
    Console.write(message);
    lastMessage = message;
  }
}

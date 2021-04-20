import 'package:kata_rover/orientation.dart';
import 'package:kata_rover/pen.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:kata_rover/rover.dart';
import 'package:console/console.dart';

void main(List<String> args) async {
  final plan = Plan(
      minPosition: Position(x: 0, y: 0),
      maxPosition: Position(x: 10, y: 9),
      obstables: <Position>[
        Position(x: 5, y: 5),
      ]);

  final rover = Rover(
      position: Position(x: 4, y: 5),
      vector: Orientation.NORTH.vector,
      plan: plan);

  final pen = Pen();

  final commands = [
    Command.FORWARD,
    Command.RIGHT,
    Command.FORWARD,
    Command.FORWARD,
    Command.RIGHT,
    Command.FORWARD,
    Command.FORWARD,
    Command.FORWARD,
    Command.FORWARD,
    Command.FORWARD,
    Command.FORWARD,
  ];

  Console.init();
  _print(pen.draw(plan, rover: rover));
  await Future.delayed(Duration(milliseconds: 500));
  for (final command in commands) {
    rover.execute(command);
    _print(pen.draw(plan, rover: rover));
    await Future.delayed(Duration(milliseconds: 500));
  }
}

String? lastMessage;
void _print(String message) {
  if (lastMessage != null) {
    Console.moveCursorUp(lastMessage!.split('\n').length - 1);
    Console.moveCursorBack(lastMessage!.split('\n')[0].length);
  }
  Console.write(message);
  lastMessage = message;
}

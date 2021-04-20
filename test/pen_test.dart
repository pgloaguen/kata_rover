import 'package:kata_rover/orientation.dart';
import 'package:kata_rover/pen.dart';
import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:kata_rover/rover.dart';
import 'package:test/test.dart';

void main() {
  test('Pen should be able to draw empty plan', () {
    final plan = const Plan(
        minPosition: Position(x: 0, y: 0),
        maxPosition: Position(x: 3, y: 2),
        obstables: [Position(x: 1, y: 1)]);

    final pen = Pen();

    expect(pen.draw(plan), equals(' - - - - \n - x - - \n - - - - \n'));
  });

  test('Pen should be able to draw plan with rover', () {
    final plan = const Plan(
        minPosition: Position(x: 0, y: 0),
        maxPosition: Position(x: 3, y: 2),
        obstables: [Position(x: 1, y: 1)]);

    final rover = Rover(
        position: const Position(x: 1, y: 2),
        vector: Orientation.NORTH.vector,
        plan: plan);

    final pen = Pen();

    expect(pen.draw(plan, rover: rover),
        equals(' - - - - \n - x - - \n - ^ - - \n'));
  });
}

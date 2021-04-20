import 'package:kata_rover/plan.dart';
import 'package:kata_rover/position.dart';
import 'package:test/test.dart';

void main() {
  test('map is well initiated', () {
    final plan = Plan(
        minPosition: Position(x: 0, y: 0),
        maxPosition: Position(x: 10, y: 9),
        obstables: []);
    expect(plan.minPosition, equals(Position(x: 0, y: 0)));
    expect(plan.maxPosition, equals(Position(x: 10, y: 9)));
  });

  test('map is spheric', () {
    final plan = Plan(
        minPosition: Position(x: 0, y: 0),
        maxPosition: Position(x: 10, y: 9),
        obstables: []);
    expect(plan.locate(Position(x: -1, y: 5)), equals(Position(x: 10, y: 5)));
    expect(plan.locate(Position(x: 11, y: 5)), equals(Position(x: 0, y: 5)));
    expect(plan.locate(Position(x: 5, y: -1)), equals(Position(x: 5, y: 9)));
    expect(plan.locate(Position(x: 5, y: 10)), equals(Position(x: 5, y: 0)));
  });

  test('map throw an error if an obstable is on the position', () {
    final plan = Plan(
        minPosition: Position(x: 0, y: 0),
        maxPosition: Position(x: 10, y: 9),
        obstables: <Position>[
          Position(x: 5, y: 5),
        ]);

    expect(() => plan.locate(Position(x: 5, y: 5)),
        throwsA(isA<ObstacleException>()));
  });
}

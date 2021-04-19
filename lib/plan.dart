import 'position.dart';

class Plan {
  final Position minPosition;
  final Position maxPosition;

  Plan({required this.minPosition, required this.maxPosition});

  Position locate(Position position) {
    return Position(
        x: position.x % (maxPosition.x + 1),
        y: position.y % (maxPosition.y + 1));
  }
}

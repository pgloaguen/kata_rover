import 'position.dart';

class Plan {
  Plan(
      {required this.minPosition,
      required this.maxPosition,
      required this.obstables});

  final Position minPosition;
  final Position maxPosition;
  final List<Position> obstables;

  Position locate(Position position) {
    final locatePosition = Position(
        x: position.x % (maxPosition.x + 1),
        y: position.y % (maxPosition.y + 1));

    return obstables.contains(position)
        ? throw ObstacleException('An obstacle is at position: $locatePosition')
        : locatePosition;
  }
}

class ObstacleException implements Exception {
  const ObstacleException(this.message) : super();
  final String message;

  @override
  String toString() {
    return 'ObstacleException: $message';
  }
}

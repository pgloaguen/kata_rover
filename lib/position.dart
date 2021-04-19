class Position {
  Position({required this.x, required this.y});
  final int x;
  final int y;

  @override
  String toString() => '($x, $y)';

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

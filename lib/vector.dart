import 'dart:math';

class Vector {
  Vector({required this.x, required this.y});
  Vector get reversed => Vector(x: x * -1, y: y * -1);
  final int x;
  final int y;

  Vector rotate(int degrees) {
    //𝑥2=cos𝛽𝑥1−sin𝛽𝑦1
    //𝑦2=sin𝛽𝑥1+cos𝛽𝑦1
    final radians = degrees * pi / 180.0;
    return Vector(
        x: (cos(radians) * x - sin(radians) * y).toInt(),
        y: (sin(radians) * x - cos(radians) * y).toInt());
  }

  @override
  String toString() => '($x, $y)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vector &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

const int fps = 24;
const int microsecondsInSecond = 100000;
const int frameRenewalTimeInMicroseconds = microsecondsInSecond ~/ fps;

class Coordinates {
  Coordinates({required this.x, required this.y});
  double x;
  double y;
}
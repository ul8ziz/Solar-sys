import 'package:flutter/foundation.dart';

import '../planet.dart';

class PlanetListProvider extends ChangeNotifier {
  List<Planet> planetList = [];

  void add(Planet planet) {
    planetList.add(planet);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/planet.dart';
import '../../../../core/providers/planet_list_provider.dart';
import '../../AddPlanetScreen/add_planet_screen.dart';
import '../widgets/solar_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAnimationRunning = true;
  late List<Planet> planets;

  Planet mercury = Planet(
      radius: 10,
      color: Colors.brown,
      speed: 6,
      distanceFromCenter: 120,
      angleInDegrees: 0);

  Planet earth = Planet(
      radius: 25,
      color: Colors.blue,
      speed: 14,
      distanceFromCenter: 200,
      angleInDegrees: 300);

  Planet jupiter = Planet(
      radius: 50,
      color: Colors.brown,
      speed: 5,
      distanceFromCenter: 400,
      angleInDegrees: 180);

  @override
  void initState() {
    context.read<PlanetListProvider>().planetList = [
      mercury,
      earth,
      jupiter
    ];
    planets = context.read<PlanetListProvider>().planetList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<PlanetListProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return const AddPlanetScreen();
                }));
      }),
      body: SolarBuilder(
          planets: planets,
          animationRunning: _isAnimationRunning),
    );
  }
}

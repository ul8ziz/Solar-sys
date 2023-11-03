import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/planet_list_provider.dart';
import 'features/_common/HomeScreen/view/home_screen.dart';

void main() {
  runApp(const SolarSystem());
}

class SolarSystem extends StatelessWidget {
  const SolarSystem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => PlanetListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Solar system test task',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}


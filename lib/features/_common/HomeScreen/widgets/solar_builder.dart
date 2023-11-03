import 'dart:async';
import 'package:flutter/material.dart';
import 'package:solar_sys/features/_common/HomeScreen/widgets/paint_space_object.dart';

import '../../../../core/calculation_helpers/calculate_scale_modifier.dart';
import '../../../../core/calculation_helpers/farest_planet_distance.dart';
import '../../../../core/constants.dart';
import '../../../../core/planet.dart';
import '../../../../core/space_object.dart';


class SolarBuilder extends StatefulWidget {
  const SolarBuilder(
      {required this.planets, this.animationRunning = true, Key? key})
      : super(key: key);
  final List<Planet> planets;
  final bool animationRunning;

  @override
  _SolarBuilderState createState() => _SolarBuilderState();
}

class _SolarBuilderState extends State<SolarBuilder> {
  late Offset _screenCenter;
  late double _scaleModifier;
  late double _longestDistance;
  late Timer _timer;
  late SpaceObject _sun;

  @override
  void initState() {
    _timer = Timer.periodic(
         const Duration(microseconds: frameRenewalTimeInMicroseconds),
        _drawFrame);
    _sun = SpaceObject(radius: 80, color: Colors.yellow);
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    _calculateScale(screenSize);
    List<Widget> spaceObjects = [];
    spaceObjects.add(CustomPaint(
        painter: PaintSpaceObject(
            spaceObject: _sun,
            screenCenter: _screenCenter,
            scaleModifier: _scaleModifier,

            ///setting ShallRebuildWithSetState to false excludes motionless Sun
            /// from rebuilding with each setState
            shallRebuildWithSetState: false)));
    for (Planet planet in widget.planets) {
      spaceObjects.add(CustomPaint(
          painter: PaintSpaceObject(
        spaceObject: planet,
        screenCenter: _screenCenter,
        scaleModifier: _scaleModifier,
      )));
    }
    return Stack(children: spaceObjects);
  }

  _drawFrame(dynamic timestamp) {
    if (!widget.animationRunning) {
      return;
    } else {
      for (Planet planet in widget.planets) {
        planet.angleInDegrees += planet.speed / fps;
      }
      setState(() {});
    }
  }

  _calculateScale(Size screenSize) {
    _screenCenter = Offset(screenSize.width / 2, screenSize.height / 2);
    _longestDistance = longestPlanetDistance(widget.planets);
    _scaleModifier = calculateScaleModifier(screenSize, _longestDistance);
  }
}

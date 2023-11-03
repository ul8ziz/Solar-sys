import 'package:flutter/material.dart';
import 'package:solar_sys/features/_common/HomeScreen/widgets/paint_space_object.dart';

import '../../../../core/space_object.dart';

class SpaceObjectWidget extends StatelessWidget {
  const SpaceObjectWidget(
      {required this.spaceObject,
      this.scaleModifier,
      this.screenCenter,
      Key? key})
      : super(key: key);
  final SpaceObject spaceObject;
  final Offset? screenCenter;
  final double? scaleModifier;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: PaintSpaceObject(
            spaceObject: spaceObject,
            screenCenter: screenCenter ?? const Offset(0, 0),
            scaleModifier: scaleModifier ?? 1));
  }
}

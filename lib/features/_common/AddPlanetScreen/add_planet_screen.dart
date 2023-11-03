import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/planet.dart';
import '../../../core/providers/color_provider.dart';
import '../../../core/providers/planet_list_provider.dart';
import '../HomeScreen/widgets/color_picker_button.dart';
import '../HomeScreen/widgets/field_for_doubles.dart';

class AddPlanetScreen extends StatefulWidget {
  const AddPlanetScreen({Key? key}) : super(key: key);

  @override
  _AddPlanetScreenState createState() => _AddPlanetScreenState();
}

class _AddPlanetScreenState extends State<AddPlanetScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _speedFieldController = TextEditingController();
  final TextEditingController _distanceFieldController =
      TextEditingController();
  final TextEditingController _radiusFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final planetListProvider = Provider.of<PlanetListProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'ADD YOUR PLANET',
              style: TextStyle(fontSize: 20),
            )),
            const SizedBox(height: 10,),
            FieldForDoubles(
              controller: _radiusFieldController,
              hint: 'enter radius',
            ),
            FieldForDoubles(
              controller: _distanceFieldController,
              hint: 'enter distance',
            ),
            FieldForDoubles(
              controller: _speedFieldController,
              hint: 'enter speed',
            ),
            const ColorPickerButton(),
             Container(
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius:  BorderRadius.circular(10),
               ),
              child: ElevatedButton(
                  onPressed: () {
                    FormState formState = _formKey.currentState!;
                    if (formState.validate()) {
                      planetListProvider.add(
                          Planet(
                          radius: double.parse(_radiusFieldController.text),
                          speed: double.parse(_speedFieldController.text),
                          distanceFromCenter: double.parse(_distanceFieldController.text),
                          color: ColorProvider.instance.color!,
                          angleInDegrees: 0)
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('ADD PLANET')),
            )
          ],
        ),
      ),
    )));
  }

  @override
  void dispose() {
    _distanceFieldController.dispose();
    _speedFieldController.dispose();
    _radiusFieldController.dispose();
    super.dispose();
  }
}

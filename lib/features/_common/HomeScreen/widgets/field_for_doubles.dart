import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldForDoubles extends StatelessWidget {
  const FieldForDoubles({required this.controller, this.hint, Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
          ],
          decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  borderRadius:  BorderRadius.circular(10),
                ),
                hintStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (number) {
            if (number != null && number.isNotEmpty) {
              return null;
            } else {
              return 'value is required';
            }
          },
      ),
    );
  }
}

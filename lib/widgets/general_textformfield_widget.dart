import 'package:flutter/material.dart';

class GeneralTextformfieldWidget extends StatelessWidget {
  GeneralTextformfieldWidget({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.icon,
  });

  String hintText;
  String? Function(String?) validator;
  TextEditingController controller;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        prefixIcon: icon,
        prefixIconColor: Colors.black,
      ),
      validator: validator,
      controller: controller,
    );
  }
}

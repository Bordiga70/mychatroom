import 'package:flutter/material.dart';

import '../utils/form_validators.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            obscureText: !_showPwd,
            decoration: const InputDecoration(
              hintText: 'password',
              border: OutlineInputBorder(),
            ),
            validator: RegisterValidators().validatePassword,
            controller: widget.passwordController,
          ),
        ),

        Checkbox(
          value: _showPwd,
          onChanged: (value) {
            setState(() {
              _showPwd = !_showPwd;
            });
          },
        ),
      ],
    );
  }
}

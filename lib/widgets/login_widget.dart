import 'package:flutter/material.dart';
import 'package:mychatroom/utils/form_validators.dart';
import 'package:mychatroom/widgets/password_field_widget.dart';

import '../pages/register_page.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          children: [
            // EMAIL
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(),
              ),
              validator: RegisterValidators().validateEmail,
              controller: _emailController,
            ),
            const SizedBox(height: 16),

            // PASSWORD
            PasswordFieldWidget(passwordController: _passwordController),
            const SizedBox(height: 16),

            // LOGIN BUTTON
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),

            // GO TO REGISTER BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

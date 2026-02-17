import 'package:flutter/material.dart';
import 'package:mychatroom/pages/register_page.dart';

import '../utils/form_validators.dart';
import '../widgets/general_textformfield_widget.dart';
import '../widgets/password_field_widget.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('LOGIN'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              // EMAIL
              GeneralTextformfieldWidget(
                hintText: 'email',
                validator: RegisterValidators().validateEmail,
                controller: _emailController,
                icon: Icon(Icons.email),
              ),
              const SizedBox(height: 16),

              // PASSWORD
              PasswordFieldWidget(passwordController: _passwordController),
              const SizedBox(height: 16),

              // LOGIN BUTTON
              // TODO
              // implement login logic
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
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
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

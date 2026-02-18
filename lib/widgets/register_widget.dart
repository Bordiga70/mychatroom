import 'package:flutter/material.dart';
import 'package:mychatroom/models/user_model.dart';
import 'package:mychatroom/utils/form_validators.dart';
import 'package:mychatroom/widgets/password_field_widget.dart';

import '../helper/helper.dart';
import '../pages/login_page.dart';
import '../utils/hashing.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPwd = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            // USERNAME
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'username',
                border: OutlineInputBorder(),
              ),
              validator: RegisterValidators().validateUsername,
              controller: _usernameController,
            ),
            const SizedBox(height: 16),

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

            // PASSWORD CONFIRM
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: !_showPwd,
                    decoration: const InputDecoration(
                      hintText: 're-enter password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      }

                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
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
            ),
            const SizedBox(height: 16),

            // REGISTER BUTTON
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  String usr = _usernameController.text;
                  String email = _emailController.text;
                  String pwd = Hashing().hash(_passwordController.text);
                  // TODO
                  // should send the credentials to the server, which
                  // does password hashing, adds the user and sends back the
                  // credentials to the client, that get added to the local DB
                  DatabaseHelper.addCredentials(
                    await DatabaseHelper.init(),
                    UserModel(id: null, usr: usr, email: email, pwd: pwd),
                  );
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 16),

            // GO TO LOGIN BUTTON
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../helper/helper.dart';
import '../models/user_model.dart';
import '../utils/form_validators.dart';
import '../utils/hashing.dart';
import '../widgets/general_textformfield_widget.dart';
import '../widgets/password_field_widget.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPwd = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('REGISTER'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              // USERNAME
              GeneralTextformfieldWidget(
                hintText: 'username',
                validator: RegisterValidators().validateUsername,
                controller: _usernameController,
                icon: Icon(Icons.person),
              ),
              const SizedBox(height: 16),

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

              // PASSWORD CONFIRM
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      obscureText: !_showPwd,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "re-enter password",
                        prefixIcon: const Icon(Icons.password),
                        prefixIconColor: Colors.black,
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
      ),
    );
  }
}

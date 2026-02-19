import 'package:flutter/material.dart';
import 'package:mychatroom/pages/register_page.dart';
import 'package:mychatroom/services/database_service.dart';

import '../models/user_model.dart';
import '../services/preferences_service.dart';
import '../utils/form_validators.dart';
import '../utils/hashing.dart';
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

  final PreferencesService _preferencesService = PreferencesService();

  late List<UserModel> _localCredentials = [];

  @override
  void initState() {
    super.initState();
    initCredentials();
  }

  void initCredentials() async {
    List<UserModel> getLocalCredentials = await DatabaseService()
        .getCredentials();
    if (!mounted) return;
    setState(() {
      _localCredentials = getLocalCredentials;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void setAutoLogin(int id, String usr, String email, String pwd) {
    _preferencesService.setCurrentSessionId(id);
    _preferencesService.setCurrentSessionUsr(usr);
    _preferencesService.setCurrentSessionEmail(email);
    _preferencesService.setCurrentSessionPwd(pwd);
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
              // missing server
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text;
                    String pwd = _passwordController.text;
                    bool valid = false;

                    for (int i = 0; i < _localCredentials.length; i++) {
                      if (email == _localCredentials[i].email &&
                          Hashing().check(pwd, _localCredentials[i].pwd)) {
                        valid = true;
                        setAutoLogin(
                          _localCredentials[i].id!,
                          _localCredentials[i].usr,
                          _localCredentials[i].email,
                          _localCredentials[i].pwd,
                        );
                      }
                    }

                    if (valid) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Invalid credentials'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
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

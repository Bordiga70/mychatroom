import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class LogoutOptionWidget extends StatefulWidget {
  const LogoutOptionWidget({super.key});

  @override
  State<LogoutOptionWidget> createState() => _LogoutOptionWidgetState();
}

class _LogoutOptionWidgetState extends State<LogoutOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO
            // implement logout logic
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Center(child: Text('Logout')),
        ),
      ),
    );
  }
}

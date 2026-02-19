import 'package:flutter/material.dart';

import '../data/notifiers.dart';
import '../pages/login_page.dart';
import '../services/preferences_service.dart';

class LogoutOptionWidget extends StatefulWidget {
  const LogoutOptionWidget({super.key});

  @override
  State<LogoutOptionWidget> createState() => _LogoutOptionWidgetState();
}

class _LogoutOptionWidgetState extends State<LogoutOptionWidget> {
  final PreferencesService _preferencesService = PreferencesService();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: Card(
        child: InkWell(
          onTap: () {
            _preferencesService.clearUserPreferences();
            isDarkNotifier.value = _preferencesService.isDark;
            styleTextNotifier.value = _preferencesService.getTextStyle;

            if (!mounted) return;

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          },
          child: Center(child: Text('Logout')),
        ),
      ),
    );
  }
}

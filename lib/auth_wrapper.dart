import 'package:flutter/material.dart';
import 'package:mychatroom/services/preferences_service.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final PreferencesService _preferencesService = PreferencesService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuth();
    });
  }

  // TODO shouldn't check clear password
  Future<void> _checkAuth() async {
    if (_preferencesService.getCurrentSessionUsr != '' &&
        _preferencesService.getCurrentSessionEmail != '' &&
        _preferencesService.getCurrentSessionPwd != '' &&
        _preferencesService.getCurrentSessionId != 0) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

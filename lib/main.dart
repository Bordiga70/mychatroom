import 'package:flutter/material.dart';
import 'package:mychatroom/pages/login_page.dart';
import 'package:mychatroom/pages/main_page.dart';
import 'package:mychatroom/services/database_service.dart';
import 'package:mychatroom/services/preferences_service.dart';

import 'auth_wrapper.dart';
import 'data/notifiers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService().init();
  await DatabaseService().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const AuthWrapper(),
            '/login': (context) => const LoginPage(),
            '/home': (context) => const MainPage(),
          },
        );
      },
    );
  }
}

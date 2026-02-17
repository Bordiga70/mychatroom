import 'package:flutter/material.dart';
import 'package:mychatroom/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/notifiers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPreferences();
  runApp(const MyApp());
}

Future<void> initSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  isDarkNotifier.value = prefs.getBool('isDark') ?? false;
  // TODO add support for font size
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
          home: LoginPage(),
        );
      },
    );
  }
}

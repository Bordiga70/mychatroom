import 'package:flutter/material.dart';
import 'package:mychatroom/pages/main_page.dart';
import 'package:mychatroom/widgets/dark_mode_option_widget.dart';

import '../widgets/font_option_widget.dart';
import '../widgets/logout_option_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
        title: const Text('Settings'),
      ),
      body: Center(
        child: ListView(
          children: [
            DarkModeOptionWidget(),
            SizedBox(height: 25),
            FontOptionWidget(),
            SizedBox(height: 25),
            LogoutOptionWidget(),
          ],
        ),
      ),
    );
  }
}

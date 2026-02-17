import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/notifiers.dart';

class DarkModeOptionWidget extends StatefulWidget {
  const DarkModeOptionWidget({super.key});

  @override
  State<DarkModeOptionWidget> createState() => _DarkModeOptionWidgetState();
}

class _DarkModeOptionWidgetState extends State<DarkModeOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dark Mode'),
            Checkbox(
              value: isDarkNotifier.value,
              onChanged: (_) async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isDark', !isDarkNotifier.value);
                setState(() {
                  isDarkNotifier.value = !isDarkNotifier.value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

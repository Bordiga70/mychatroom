import 'package:flutter/material.dart';
import 'package:mychatroom/services/preferences_service.dart';

import '../data/notifiers.dart';

class DarkModeOptionWidget extends StatefulWidget {
  const DarkModeOptionWidget({super.key});

  @override
  State<DarkModeOptionWidget> createState() => _DarkModeOptionWidgetState();
}

class _DarkModeOptionWidgetState extends State<DarkModeOptionWidget> {
  final PreferencesService _preferencesService = PreferencesService();

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
                await _preferencesService.setDark(!isDarkNotifier.value);
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

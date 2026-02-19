import 'package:flutter/material.dart';

import '../data/notifiers.dart';
import '../services/preferences_service.dart';

class FontOptionWidget extends StatefulWidget {
  const FontOptionWidget({super.key});

  @override
  State<FontOptionWidget> createState() => _FontOptionWidgetState();
}

class _FontOptionWidgetState extends State<FontOptionWidget> {
  final PreferencesService _preferencesService = PreferencesService();
  late String _menuItem = _preferencesService.getTextStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Font Size'),
            SizedBox(width: 10),
            DropdownButton(
              value: _menuItem,
              autofocus: false,
              items: [
                DropdownMenuItem(value: 'small', child: Text('small')),
                DropdownMenuItem(value: 'default', child: Text('default')),
                DropdownMenuItem(value: 'big', child: Text('big')),
              ],
              onChanged: (value) async {
                setState(() {
                  styleTextNotifier.value = value!;
                  _menuItem = styleTextNotifier.value;
                });
                await _preferencesService.setStyle(styleTextNotifier.value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

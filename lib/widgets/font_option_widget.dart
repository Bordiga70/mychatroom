import 'package:flutter/material.dart';

import '../data/constants.dart';
import '../data/notifiers.dart';

class FontOptionWidget extends StatefulWidget {
  const FontOptionWidget({super.key});

  @override
  State<FontOptionWidget> createState() => _FontOptionWidgetState();
}

class _FontOptionWidgetState extends State<FontOptionWidget> {
  TextStyle? _menuItem = KTextStyle.defaultText;

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
                DropdownMenuItem(
                  value: KTextStyle.smallText,
                  child: Text('small'),
                ),
                DropdownMenuItem(
                  value: KTextStyle.defaultText,
                  child: Text('default'),
                ),
                DropdownMenuItem(value: KTextStyle.bigText, child: Text('big')),
              ],
              onChanged: (value) {
                setState(() {
                  _menuItem = value;
                  styleTextNotifier.value = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

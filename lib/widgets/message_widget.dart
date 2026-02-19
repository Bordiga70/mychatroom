import 'package:flutter/material.dart';

import '../data/constants.dart';
import '../data/notifiers.dart';
import '../services/preferences_service.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    super.key,
    required this.from,
    required this.at,
    required this.message,
  });

  final String from;
  final String at;
  final String message;

  final PreferencesService _preferencesService = PreferencesService();

  TextStyle getFontStyle(String name) {
    late TextStyle style;

    switch (name) {
      case 'small':
        style = KTextStyle.smallText;
        break;
      case 'default':
        style = KTextStyle.defaultText;
        break;
      case 'big':
        style = KTextStyle.bigText;
        break;
    }

    return style;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    from,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    at,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder(
                valueListenable: styleTextNotifier,
                builder: (context, style, child) {
                  return Text(
                    message,
                    style: getFontStyle(_preferencesService.getTextStyle),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

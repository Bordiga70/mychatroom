import 'package:flutter/material.dart';

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
              Text(message, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

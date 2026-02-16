import 'package:flutter/material.dart';

class SearchItemWidget extends StatelessWidget {
  SearchItemWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), onTap: () => print('tap')),
    );
  }
}

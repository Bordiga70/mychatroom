import 'package:flutter/material.dart';

import '../pages/user_page.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserPage(name: title)),
          );
        },
      ),
    );
  }
}

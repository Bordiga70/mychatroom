import 'package:flutter/material.dart';
import 'package:mychatroom/pages/settings_page.dart';

import '../pages/friends_page.dart';

class MainPageFooterWidget extends StatelessWidget {
  const MainPageFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            child: Text('username#id'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FriendsPage()),
              );
            },
            child: Text('Friends'),
          ),
        ],
      ),
    );
  }
}

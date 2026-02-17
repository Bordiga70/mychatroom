import 'package:flutter/material.dart';
import 'package:mychatroom/pages/chat_page.dart';

class UserPage extends StatelessWidget {
  UserPage({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 50,
              child: Card(
                child: InkWell(
                  onTap: () {
                    // TODO
                    // implement add friend logic
                    print('Add Friend');
                  },
                  child: Center(child: Text('Add Friend')),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 350,
              height: 50,
              child: Card(
                child: InkWell(
                  onTap: () {
                    // TODO
                    // implement message logic
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatPage()),
                    );
                  },
                  child: Center(child: Text('Start messaging')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

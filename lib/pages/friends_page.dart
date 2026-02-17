import 'package:flutter/material.dart';

import '../widgets/search_field_widget.dart';

// TODO
// should fetch the data from the local database
// and display all the friends via the SearchItemWidget
class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Friends list')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [SearchFieldWidget()]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mychatroom/widgets/main_page_footer_widget.dart';
import 'package:mychatroom/widgets/search_field_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('myChatroom')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [SearchFieldWidget(), MainPageFooterWidget()]),
      ),
    );
  }
}

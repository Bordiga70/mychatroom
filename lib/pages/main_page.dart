import 'package:flutter/material.dart';
import 'package:mychatroom/widgets/search_field_widget.dart';
import 'package:mychatroom/widgets/search_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _list = [
    'person1',
    'person2',
    'person3',
    'person4',
    'person5',
    'person6',
    'person1',
    'person2',
    'person3',
    'person4',
    'person5',
    'person6',
    'person1',
    'person2',
    'person3',
    'person4',
    'person5',
    'person6',
    'person1',
    'person2',
    'person3',
    'person4',
    'person5',
    'person6',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SearchFieldWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final data = _list[index];
                  return SearchItemWidget(title: data);
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => print('settings'),
                    child: Text('username#id'),
                  ),
                  TextButton(
                    onPressed: () => print('friends'),
                    child: Text('Friends'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

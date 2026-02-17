import 'package:flutter/material.dart';
import 'package:mychatroom/widgets/search_item_widget.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
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

  final List<String> _results = [];

  void _handleSearch(String input) {
    if (input.isEmpty) {
      return;
    }

    final results = _list
        .where((str) => str.toLowerCase().contains(input.toLowerCase()))
        .toList();

    setState(() {
      _results
        ..clear()
        ..addAll(results);
    });

    print(_results);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextField(
            onChanged: _handleSearch,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "Search for User",
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.black,
            ),
          ),
          _results.isEmpty
              ? const SizedBox()
              : Expanded(
                  child: ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      return SearchItemWidget(title: _results[index]);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

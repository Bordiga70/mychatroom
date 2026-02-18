import 'package:flutter/material.dart';
import 'package:mychatroom/widgets/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<MessageWidget> _test = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('USER'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // MESSAGES LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _test.length,
              itemBuilder: (context, index) {
                return _test[index];
              },
            ),
          ),
          // TEXT FIELD
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "chat",
                prefixIconColor: Colors.black,
              ),
              controller: _controller,
              onSubmitted: (value) {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    // TODO should send the message to the server and add it to the local db
                    _test.add(
                      MessageWidget(
                        from: 'username#id',
                        at: DateTime.now().toString().substring(0, 19),
                        message: _controller.text,
                      ),
                    );
                    _controller.clear();
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

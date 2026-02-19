import 'package:flutter/material.dart';
import 'package:mychatroom/services/preferences_service.dart';
import 'package:mychatroom/widgets/message_widget.dart';

import '../models/message_model.dart';
import '../services/database_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  late List<MessageModel> _messages = [];

  @override
  void initState() {
    super.initState();
    initMessages();
  }

  Future<void> initMessages() async {
    final messages = await DatabaseService().getMessages();
    if (!mounted) return;

    setState(() {
      _messages = messages;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        // TODO should send the message to the server and add it to the local db
        var message = (MessageModel(
          from: PreferencesService().getCurrentSessionId,
          to: 2,
          message: _controller.text,
          created_at: DateTime.now().toString().substring(0, 19),
          id: null,
        ));
        _messages.add(message);
        DatabaseService().addMessage(message);
        _controller.clear();
      });
    }
  }

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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return MessageWidget(
                  from: 'username#${_messages[index].from}',
                  at: _messages[index].created_at,
                  message: _messages[index].message,
                );
              },
            ),
          ),
          // TEXT FIELD
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "send a message",
                      prefixIconColor: Colors.black,
                    ),
                    controller: _controller,
                    onSubmitted: (value) {
                      sendMessage();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage();
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

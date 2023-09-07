import 'package:flutter/material.dart';

import '../widgets/chat_message.dart';
import 'package:hushh_chat/services/chat_service.dart';

/*
  Screen for displaying the chat interface.

  This file contains the main chat UI where users can see and send messages.
  Key Components:
  - [ChatScreen]: Represents the main chat interface.
  - [StatefulWidget]: A widget that can rebuild when internal state changes.
  - [Scaffold]: Provides a visual scaffold for material design widgets.
  - [ListView.builder]: Efficiently builds a scrolling list of items.
  - [TextField]: Allows users to input text.
  - [IconButton]: Button with an icon to represent its functionality, used here for sending messages.
 */
class ChatScreen extends StatefulWidget {
  // Constructor with optional Key.
  const ChatScreen({super.key});

  // Creates the mutable state for this widget.
  @override
  State createState() => ChatScreenState();
}

// Holds the state for the ChatScreen widget.
class ChatScreenState extends State<ChatScreen> {
  // List to store chat messages.
  final List<ChatMessage> _messages = [];

  // Controller to manage the text field input.
  final TextEditingController _textController = TextEditingController();

  // Boolean to track if the user is currently typing.
  bool _isComposing = false;

  // Build method to create the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hushh Chat')), // App bar title.
      body: Column(
        children: [
          // List to display chat messages.
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          // Divider to separate messages from the input field.
          const Divider(height: 1.0),
          // Input field container.
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  // Widget to build the text input composer.
  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            // Input field for typing messages.
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    const InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            // Send button.
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Handler when a message is submitted.
  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _isComposing = false;
      _messages.insert(0, ChatMessage(text: text, sentByMe: true));
    });
    var responseMessage = await postMessageToBackend(text);
    setState(() {
      _messages.insert(0, ChatMessage(text: responseMessage, sentByMe: false));
    });
  }
}

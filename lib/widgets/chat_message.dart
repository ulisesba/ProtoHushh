import 'package:flutter/material.dart';

/*
  Widget for displaying an individual chat message.

  This file defines the look and feel of a chat message, whether sent by the user or received from another user.
  Key Components:
  - [ChatMessage]: Displays the content of a chat message.
  - [StatelessWidget]: A widget that describes part of the user interface which is immutable.
  - [Row]: A linear layout that places its children horizontally.
  - [Container]: A convenience widget that combines common painting, positioning, and sizing widgets.
  - [Text]: A run of styled text.
 */
class ChatMessage extends StatelessWidget {
  // Constructor with required text and sentByMe parameters, and optional Key.
  const ChatMessage({super.key, required this.text, required this.sentByMe});

  final String text; // Text of the chat message.
  final bool sentByMe; // Boolean to check if the message was sent by the user.

  // Build method to create the widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Message container with styling based on who sent the message.
          Flexible(
              child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: sentByMe ? Colors.blue[200] : Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(text),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hushh_chat/screens/chat_screen.dart';

/*
  Main entry file for the Hushh Chat application.

  This file initializes the main app structure and theme.
  Key Components:
  - [MyApp]: Root widget of the application. Sets up the theme and initial route.
  - [MaterialApp]: Provides a consistent visual structure for the app.
  - [ChatScreen]: The initial screen for the app.
 */
void main() => runApp(const MyApp());

// Root widget of the Hushh Chat application.
class MyApp extends StatelessWidget {
  // Constructor with optional Key.
  const MyApp({super.key});

  // Build method to create the widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hushh Chat', // Application title.
      theme: ThemeData(primarySwatch: Colors.blue), // Theme data for the app.
      home: const ChatScreen(), // Initial screen of the app.
    );
  }
}

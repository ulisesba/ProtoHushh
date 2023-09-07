import 'package:http/http.dart' as http;
import 'dart:convert';

/*
  Service for interacting with the chat backend.

  This file handles the HTTP request to the backend to send a chat message and receive a response.
  Key Components:
  - [http.post]: Sends an HTTP POST request.
  - [json.encode]: Converts a map into a JSON string.
 */
Future<String> postMessageToBackend(String message) async {
  try {
    // HTTP POST request to the backend with the message.
    final response = await http.post(
      Uri.parse('http://mibackend-test.com/prueba'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'message': message}),
    );
    // Return the response message from the backend if successful.
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      return 'Error: Try again.';
    }
  } catch (e) {
    // Return an error message if something goes wrong.
    return 'Error: Try again.';
  }
}

import 'package:flutter/material.dart';

final TextEditingController _inputController = TextEditingController();
final TextEditingController _outputController = TextEditingController();
const int _shift = 3; // Number of moves in the Caesar cipher

// Function to check if a character is a letter
bool isLetter(String char) {
  final pattern = RegExp('[a-zA-Z]');
  return pattern.hasMatch(char);
}

// Function to encrypt text
String encrypt(String text, int shift) {
  String result = '';
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    if (isLetter(char)) {
      String shiftedChar = String.fromCharCode(
          (char.codeUnitAt(0) - 'a'.codeUnitAt(0) + shift) % 26 + 'a'.codeUnitAt(0));
      result += shiftedChar;
    } else {
      result += char;
    }
  }
  return result;
}

// Function to decipher text
String decrypt(String text, int shift) {
  return encrypt(text, 26 - shift);
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _inputController,
            decoration: const InputDecoration(labelText: 'Text to be encrypted/decrypted'),
          ),
          TextField(
            controller: _outputController,
            decoration: const InputDecoration(labelText: 'Result'),
            readOnly: true,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  String inputText = _inputController.text.toLowerCase();
                  String encryptedText = encrypt(inputText, _shift);
                  _outputController.text = encryptedText;
                },
                child: const Text('Digit'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  String inputText = _inputController.text.toLowerCase();
                  String decryptedText = decrypt(inputText, _shift);
                  _outputController.text = decryptedText;
                },
                child: const Text('Decrypts'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

@override
void dispose() {
  _inputController.dispose();
  _outputController.dispose();
}

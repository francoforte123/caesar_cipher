import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaesarCipher extends StatefulWidget {
  const CaesarCipher({Key? key}) : super(key: key);

  @override
  State<CaesarCipher> createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<CaesarCipher> {
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  final int _shift = 3; // Number of moves in the Caesar cipher

  late int shiftUserInput=0; // Number of moves via user input for the Caesar cipher
  final TextEditingController _inputControllerUserInput = TextEditingController();
  final TextEditingController _outputControllerUserInput = TextEditingController();



  //-------------------PART OF CODE FOR ENCRYPTING AND DECRYPTING WITH THE NUMBER OF MOVES SET TO USER----------------------
  // Function to encrypt text
  String encryptUserInput(String text, int shift) {
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
  String decryptUserInput(String text, int shift) {
    return encrypt(text, 26 - shift);
  }


  //-------------------PART OF CODE FOR ENCRYPTING AND DECRYPTING WITH THE NUMBER OF MOVES SET TO 3----------------------
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("This is an example of a number of moves in the Caesar cipher set to 3 moves"),
            ),
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
            const Divider(height: 20, color: Colors.black,),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("This is an example of a number of moves in the Caesar cipher set of user input"),
            ),
            TextField(
              controller: _inputControllerUserInput,
              decoration: const InputDecoration(labelText: 'Text to be encrypted/decrypted'),
            ),
            TextField(
              controller: _outputControllerUserInput,
              decoration: const InputDecoration(labelText: 'Result'),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            const Text('Shifts in the Caesar cipher:'),
            Slider(
              value: shiftUserInput.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  shiftUserInput = newValue.toInt();
                });
              },
              min: 0,
              max: 26,
              divisions: 25,
              label: shiftUserInput.toString(),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    String inputText = _inputControllerUserInput.text.toLowerCase();
                    String encryptedText = encrypt(inputText, shiftUserInput);
                    _outputControllerUserInput.text = encryptedText;
                  },
                  child: const Text('Digit'),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String inputText = _inputControllerUserInput.text.toLowerCase();
                    String decryptedText = decrypt(inputText, shiftUserInput);
                    _outputControllerUserInput.text = decryptedText;
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
    _inputControllerUserInput.dispose();
    _outputControllerUserInput.dispose();
    super.dispose();
  }
}

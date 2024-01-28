import 'package:flutter/material.dart';

class customScoreButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedCallback;

  const customScoreButton({
    Key? key,
    required this.buttonText,
    required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        primary: Colors.blue,
        minimumSize: Size(60, 60),
      ),
      onPressed: onPressedCallback,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

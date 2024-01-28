import 'package:flutter/material.dart';

Widget buildSplashWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/penguinie.png'),
      SizedBox(height: 20),
      Text(
        'Welcome to penguinie',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ],
  );
}

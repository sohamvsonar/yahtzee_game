// main.dart
import 'package:flutter/material.dart';
import 'views/yahtzee.dart';

void main() {
  runApp(MaterialApp(
    title: 'Yahtzee',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Yahtzee'),
      ),
      body: Center(
        child: Yahtzee(),
      ),
    ),
  ));
}
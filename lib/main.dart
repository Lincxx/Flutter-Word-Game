import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final noun = WordNoun.random();
  final adjective = WordAdjective.random();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Game',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Word Game'),
        ),
        body: Center(
          child: Text(
              'The programmer wrote a ${adjective.asCapitalized} app in Flutter and showed it off to his ${noun.asCapitalized}'),
        ),
      ),
    );
  }
}

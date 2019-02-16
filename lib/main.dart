import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Word Game', home: RandomSentences());
  }
}

class RandomSentences extends StatefulWidget {
  @override
  _RandomSentencesState createState() => _RandomSentencesState();
}

class _RandomSentencesState extends State<RandomSentences> {
  final _sentences = <String>[];
  final _biggerFont = TextStyle(fontSize: 14.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Game'),
      ),
      body: _buildSentences(),
    );
  }

  String _getSentence() {
    final noun = WordNoun.random();
    final adjective = WordAdjective.random();
    return 'The programmer wrote a ${adjective.asCapitalized} app in Flutter and showed it off to his ${noun.asCapitalized}';
  }

  Widget _buildRow(String sentence) {
    return ListTile(
      title: Text(
        sentence,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSentences() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _sentences.length) {
          for (int x = 0; x < 10; x++) {
            _sentences.add(_getSentence());
          }
        }
        return _buildRow(_sentences[index]);
      },
    );
  }
}

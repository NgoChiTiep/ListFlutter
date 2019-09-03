import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
    return new MaterialApp(
      title: 'My app demo',
      home: RandomEnglish(),
    );
  }
}

class RandomEnglish extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomEnglishState();
  }
}

class RandomEnglishState extends State<RandomEnglish> {
  final wordPair = <WordPair>[];
  final checked = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My List'),
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        if (index >= wordPair.length) {
          wordPair.addAll(generateWordPairs().take(10));
        }
        return _itemRow(wordPair[index], index);
      }),
    );
  }

  Widget _itemRow(WordPair wordPair, int index) {
    var color = index % 2 == 0 ? Colors.red : Colors.green;
    final ischecked = checked.contains(wordPair);
    clickItem(index) {
      setState(() {
        if(ischecked){
          checked.remove(wordPair);
        }
        else{
          checked.add(wordPair);
        }
      });
    }

    return new ListTile(
      leading:
          new Icon(ischecked ? Icons.check_box : Icons.check_box_outline_blank),
      onTap: () => clickItem(index),
      title: new Text(
        wordPair.asUpperCase,
        style: new TextStyle(color: color),
      ),
    );
  }
}

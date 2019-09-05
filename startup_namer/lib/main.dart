import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'welcome to flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white
      ),
      home: Scaffold(
        appBar: AppBar(
            //文本单一样式
//          title: Text('welcome to flutter'),
            //文本混合样式
            title: Text.rich(TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red)),
                TextSpan(text: ' '),
                TextSpan(text: 'to',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green)),
                TextSpan(text: ' '),
                TextSpan(text: 'flutter',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue))
              ]
            )),
        ),
        body: Center(
//          child: Text('hello world'),
        child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();

}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('startup name generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          IconButton(icon: Icon(Icons.link), onPressed: _showImage)
          
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
        itemBuilder: (context,i){
          if(i.isOdd){
            return Divider();
          }
          final index = i ~/ 2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        },
        padding: const EdgeInsets.all(16.0),
    );
  }

  Widget _buildRow(WordPair pair){
    final  alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          } else{
            _saved.add(pair);
          }
        });
      },
    );
  }


  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text('saved suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  //图片
  void _showImage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: Text('显示图片'),
        ),
        body: Center(
          child: Image.network('https://static001.geekbang.org/resource/image/69/dc/6924de885de1734f3e364015db7d38dc.jpg'),
        ),
      );
    }));
  }
}

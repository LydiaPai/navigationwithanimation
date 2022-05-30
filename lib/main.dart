import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    //建立AppBar
    final appBar = AppBar(
      title: Text('切換畫面'),
    );
    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    var listView = ListView(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('House'),
          onTap:()=>textWrapper.setText('房子'),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('person'),
          onTap:()=>textWrapper.setText('人'),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('House'),
          onTap:()=>textWrapper.setText('房子'),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('notifications'),
          onTap:()=>textWrapper.setText('鈴鐺'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('sports_tennis'),
          onTap:()=>textWrapper.setText('網球'),
        ),
        ListTile(
          leading: Icon(Icons.coffee),
          title: Text('coffee'),
          onTap:()=>textWrapper.setText('咖啡'),
        ),
        ListTile(
          leading: Icon(Icons.dining),
          title: Text('dining'),
          onTap:()=>textWrapper.setText('用餐'),
        ),
        ListTile(
          leading: Icon(Icons.tv),
          title: Text('tv'),
          onTap:()=>textWrapper.setText('電視'),
        ),
      ],
    );

    final btn = RaisedButton(
      child: Text('開啟第二頁'),
      onPressed: ()=>
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SecondPage())),
    );

    final widget = Container(
      child: Column(
        children:  [
          textWrapper,
          Expanded(child: listView),
          Expanded(child: btn),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10,),
    );

    //結合AppBar 和 App操作畫面
    final page = Scaffold(
      appBar: appBar,
      body: widget,
    );
    return page;
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  _TextWrapper(this._key): super (key: _key);

  State<StatefulWidget> createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState?.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = '';

  Widget build(BuildContext context) {
    var widget = Text(
      _str,
      style:  TextStyle(fontSize: 20),
    );

    return widget;
  }

  setText(String string) {
    setState(() {
      _str = string;
    });
  }
}




class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    //建立AppBar
    final appBar = AppBar(
      title: Text('第二頁'),
      backgroundColor: Colors.amber,
    );

    final btn = RaisedButton(
      child: Text('回到上一頁'),
      onPressed: ()=>
          Navigator.pop(context),
    );

    final widget = Container(
      child: btn,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(30),
    );

    //結合AppBar 和 App操作畫面
    final page = Scaffold(
      appBar: appBar,
      body: widget,
      backgroundColor: Color.fromARGB(255, 220, 220, 220),
    );
    return page;
  }
}

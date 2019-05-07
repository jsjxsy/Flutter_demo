import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_router": (context) => NewRoute(),
        "tip_router": (context) => TipRoute("this is tip router")
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
//                  Navigator.pushNamed(context, "tip_router");
//                Navigator.pushNamed(context, "new_router");
//                Navigator.push(
//                    context,
//                    new MaterialPageRoute(
//                        builder: (context) {
//                          return new NewRoute();
//                        },
//                        settings: new RouteSettings(
//                            name: "page1", isInitialRoute: false),
//                        maintainState: true,
//                        fullscreenDialog: false));

//                Navigator.push(
//                  context,
//                  new MaterialPageRoute(builder: (context) {
//                    return new RandomWordsWidget();
//                  }),
//                );

//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  return ButtonWidget();
//                }));

                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return MessageForm();
                }));
              },
            ),
            new DecoratedBox(
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('images/ic_launcher.png')))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("app Bar"),
        ),
        body: Center(
          child: Text("This is new route"),
        ));
  }
}

class TipRoute extends StatelessWidget {
  final String tip;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("this is tip route"),
      ),
      body: Center(
        child: Text(tip),
      ),
    );
  }

  TipRoute(this.tip);
}

class DebugRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("this is print");
    debugPrint("this is debugPrint");
    // TODO: implement build
    return new Material(
      child: new Center(
        child: new FlatButton(
          onPressed: () {
            debugDumpApp();
            // debugDumpRenderTree();
          },
          child: new Text('Dump App'),
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class BarWidget extends StatefulWidget {
  @override
  State createState() {
    return _BarWidgetState();
  }
}

class _BarWidgetState extends State<BarWidget> {
  var i = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('i = $i'),
        RaisedButton(
          onPressed: () {
            setState(() {
              ++i;
            });
          },
          child: Text('click'),
        )
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "this is Text Widget",
      style: TextStyle(
          color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flatButton = FlatButton(
      onPressed: () => print("flat button pressed!"),
      child: Text("Button"),
    );
    var raiseButton = RaisedButton(
      onPressed: () {
        print("raise button pressed!");
      },
      child: Text("Button"),
    );
    return raiseButton;
  }
}

class MessageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: editController,
            ),
          ),
          RaisedButton(
              child: Text("click"),
              onPressed: () {
                showDialog(
                    // 第一个 context 是参数名，第二个 context 是 State 的成员变量
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        // dialog 的内容
                        content: Text(editController.text),
                        // actions 设置 dialog 的按钮
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            // 用户点击按钮后，关闭弹框
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RowWidget();
                              }));
                            },
                          )
                        ],
                      );
                    });
              })
        ],
      ),
    ));

//    return Scaffold(
//        body: Center(
//            child: Row(
//      children: <Widget>[
//        Expanded(
//          child: TextField(
//            controller: editController,
//          ),
//        ),
//        RaisedButton(
//          child: Text("click"),
//          onPressed: () => print('text inputted: ${editController.text}'),
//        )
//      ],
//    )));
  }

  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }
}

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Row(
          children: <Widget>[
            Text('text1'),
            Text('text2'),
            Text('text3'),
            Text('text4'),
            FlatButton(
              child: Text("Button"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StackWidget();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Stack(
          // Aligment 的取值范围为 [-1, 1]，Stack 中心为 (0, 0)，
          // 这里设置为 (-0.5, -0.5) 后，可以让文本对齐到 Container 的 1/4 处
          alignment: const Alignment(-1, -1),
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
            ),
            Text("text1"),
            Text("text2 3 4 5 6 7 8 9"),
            RaisedButton(
              child: Text("RaisedButton"),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ImageWidget();
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: GestureDetector(
            child: new Image.network(
              'https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
              scale: 2.0,
              repeat: ImageRepeat.repeatY,
              fit: BoxFit.cover,
            ),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImageListView();
                })),
          ),
          width: 400.0,
          height: 300.0,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}

class ImageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(scrollDirection: Axis.vertical, children: <Widget>[
      GestureDetector(
        child: new Image.network(
            'https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
            width: 300,
            height: 200,
            fit: BoxFit.fill),
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TileListView();
            })),
      ),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill),
      new Image.network('https://img.mukewang.com/5c78a32e09afc8c106400220.jpg',
          width: 300, height: 200, fit: BoxFit.fill)
    ]);
  }
}

class TileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          GestureDetector(
            child: new ListTile(
                leading: new Icon(Icons.border_right),
                title: new Text('border_right')),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LocalImage();
                })),
          ),
          new ListTile(
              leading: new Icon(Icons.access_alarm),
              title: new Text('access_alarm')),
          new ListTile(
              leading: new Icon(Icons.access_time),
              title: new Text('access_time'))
        ]),
      ),
    );
  }
}

class LocalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Image.asset("images/ic_launcher.png"),
      ),
    );
  }
}

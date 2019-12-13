import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            SizedBox(
              height: 30.0,
            ),
            Conditional.single(
              conditionBuilder: () => _counter % 2 == 0,
              widgetBuilder: () {
                return Column(
                  children: <Widget>[
                    Text(
                      'The number is even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Icon(
                      Icons.check,
                      size: 60.0,
                      color: Colors.green,
                    ),
                  ],
                );
              },
              fallbackBuilder: () {
                return Column(
                  children: <Widget>[
                    Text(
                      'The number is not even.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Icon(
                      Icons.close,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

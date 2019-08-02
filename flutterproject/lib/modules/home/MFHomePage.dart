
import 'package:flutter/material.dart';

class MFHomePage extends StatefulWidget {

  final String title;

  MFHomePage({Key key, this.title}) : super(key: key);

  @override
  _MFHomePageState createState() => _MFHomePageState();
}

class _MFHomePageState extends State<MFHomePage> {

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display4,
            ),

            Text(
              '234535',
              style: TextStyle(
                color: Color(0xFFFF0000),
                backgroundColor: Colors.deepPurple,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFF333388),
                decorationStyle: TextDecorationStyle.wavy,
                fontWeight: FontWeight.w500,
                fontSize: 50,
              ),
            )

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

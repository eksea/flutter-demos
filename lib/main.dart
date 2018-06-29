import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'demos/canvas.dart';
import 'demos/lakes.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(Demos());
}

class Demos extends StatelessWidget {
  final appTitle = 'Flutter Demos';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: DemosHomePage(title: appTitle),
    );
  }
}

class DemosHomePage extends StatelessWidget {
  final String title;

  DemosHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Home Page!')),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('All Demos'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Canvas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) {
                      return new DemosCanvas();
                    }
                  )
                );
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) {
                      return new MyApp();
                    }
                  )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

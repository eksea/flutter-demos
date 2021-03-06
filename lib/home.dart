import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/icon.jpg'),
        ),
      ),
    );
    
    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome to Flutter Demo',
        style: TextStyle(fontSize: 28.0, color: Color(0xFF282828)),
      ),
    );

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'I learn Flutter by this project.',
        style: TextStyle(fontSize: 16.0, color: Color(0xFF282828)),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[logo, welcome, text],
      ),
    );

    return Scaffold(
      body: body
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool isLoggingIn = false;

  onLoginClick() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).push(
        new MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return DemosHomePage(title: 'Flutter Demos');
          }
        )
      );
      isLoggingIn = false;
    });
    setState(() {
      isLoggingIn = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    isLoggingIn = false;
}

  @override
  Widget build(BuildContext context) {
    var loginButtonWidget;
    if(isLoggingIn) {
      var animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
      Animation<Color> animation = new Tween(begin: Colors.white, end: Colors.black).animate(animationController);
      loginButtonWidget = CircularProgressIndicator(backgroundColor: Colors.white, valueColor: animation,);
    }
    else {
      loginButtonWidget = Text('Log In', style: TextStyle(color: Colors.white),);
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('images/icon.jpg'),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: onLoginClick,
          color: Colors.lightBlueAccent,
          child: loginButtonWidget,
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text('Forgot Password?', style: TextStyle(color: Colors.black54),),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            username,
            SizedBox(height: 8.0,),
            password,
            SizedBox(height: 24.0,),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );

  }
}
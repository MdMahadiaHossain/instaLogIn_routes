import 'package:flutter/material.dart';
import './ui/home_page.dart';
import './ui/insta_login.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // mapping the routes with WidgetBuilder
  final Map routes= <String,WidgetBuilder>{
    LoginPage.tag : (context) => LoginPage(),
    HomePage.tag  : (contest) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        fontFamily: "Oswald-Light",
      ),
      // we need to give all the routes information to the MaterialApp widget, MaterialApp widget has "routes" property
      routes: routes,

    );
  }
}

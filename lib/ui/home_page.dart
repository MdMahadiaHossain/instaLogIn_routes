import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatelessWidget {
  static String tag = "home-page";
  final profilePic = Hero(
      // hero creates an effect which is called hero effect
      tag: "Hero",
      child: Container(
        height: 100.0,
        width: 100.0,
        margin: EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/images/me.jpg"),
          ),
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white, width: 6.0, style: BorderStyle.solid),
        ),
      ));

  final welcomeText = Padding(
    padding: EdgeInsets.all(10.0),
    child: Text(
      "Welcome: Mahadi Hossain",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 18.0,
        decoration: TextDecoration.none,
      ),
    ),
  );

  final description = Padding(
    padding: EdgeInsets.all(20.0),
    child: Text(
      content,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        decoration: TextDecoration.none,
      ),
    ),
  );

  Widget simpleDialogue(BuildContext context) => SimpleDialog(
        title: Text(
          "I am a Dialogue",
          textAlign: TextAlign.center,
        ),
        titlePadding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(50.0),
            child: MaterialButton(
              child: Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(),
              splashColor: Colors.indigo,
              color: Colors.blueAccent,
              elevation: 2.0,
              //   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            ),
          ),
        ],
        contentPadding:
            EdgeInsets.only(left: 60.0, right: 60.0, top: 10.0, bottom: 30.0),
      );

  Future<Null> concurrentDialogue(BuildContext context) {
    return showDialog(
      // Returns a Future object, which means it becomes another screen in parallel
      context: context,
      builder: (BuildContext context) => simpleDialogue(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = Material(
      borderRadius: BorderRadius.circular(50.0),
      child: MaterialButton(
        child: Text(
          "more",
          style: TextStyle(color: Colors.indigo),
        ),
        onPressed: () => concurrentDialogue(context),
        splashColor: Colors.blueAccent,
        color: Colors.white,
        elevation: 2.0,
        padding:
            EdgeInsets.only(left: 70.0, right: 70.0, top: 10.0, bottom: 10.0),
      ),
    );

    return Material(
      child: Container(
          width: double.infinity,
          // in BoxDecoration we get color, border, borderRadius, shape gradient, image, boxShadow
          // if we use color in Container widget property , we can not use color property in BoxDecoration
          decoration: BoxDecoration(
            // there are two types of gradient - linearGradient, RedialGradient
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent]),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[profilePic, welcomeText, description, button],
            ),
          )),
    );
  }

  static final content =
      """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.""";
}

import 'package:flutter/material.dart';
import './home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logo = Hero(
      tag: "Hero",
      child: Container(
        height: 70.0,
        width: 70.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/images/me.jpg"),
          ),
          shape: BoxShape.circle,
        ),
      ));

  final email = TextFormField(
    // another one is TextField
    keyboardType: TextInputType.emailAddress,
    // there are date, time, number, text, numberWithOption
    autofocus: false,
    //initialValue: "mahadi@gmail.com",
    decoration: InputDecoration(
      hintText: "Email . . . ",
      contentPadding:
          EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );

  final password = TextFormField(
    // another one is TextField
    autofocus: false,
    obscureText: true, // hides password texts
    decoration: InputDecoration(
      hintText: "password . . . ",
      contentPadding: // bring te text of TextField in the center of TextField
          EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
    ),
  );



  final forgetLabel = FlatButton(
    onPressed: () => debugPrint("forget button pressed"),
    child: Text(
      "Forgot password?",
      style: TextStyle(
        color: Colors.black54,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
   // loginButton has been kept in build method because inOnpress body we need to pass "context" value
    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      // we can use it instead of "Container" widget to bring material design effect
      // we in this material container widget can use other widget as child like we do in container
      // in "Material" widget has borderRadius, animationDuration, shadowColor,  elevation, Shape
      child: Material(  // to render the button Material effects and supply border redius property
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () => Navigator.of(context).pushNamed(HomePage.tag)
          ,
          minWidth: 200.0,
          height: 42.0,
          color: Colors.lightBlueAccent,
          child: Text(
            "Log In",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );




    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
          body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Center( // without center widget container-BoxDecoration-circled image is not circled, EVEN SIZEBOX, CONTAINER CAN NOT RENDER ITS CHILD "container-BoxDecoration-circled image" AS CIRCLED
              child: logo,
            ),
            SizedBox(
              height: 48.0,
            ),
            email,
            SizedBox(
              height: 8.0,
            ),
            password,
            SizedBox(
              height: 8.0,
            ),
            loginButton,
            forgetLabel,
          ],
        ),
      )),
    );
  }
}

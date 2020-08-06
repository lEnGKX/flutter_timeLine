import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: SingleChildScrollView(
          child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/girlPhotos.png',
                height: 100.0,
                fit: BoxFit.fitHeight,
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 40.0)),
              new Text(
                'Welcome to Timeline',
                style: new TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ColaCareFontKaiTi',
                    color: Color.fromRGBO(60, 109, 96, 1.0)),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 40.0)),
              new Container(
                width: 350.0,
                child: new TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    hintText: "Username or mailbox",
                    prefixIcon: Icon(Icons.person),
//                  labelText: '',
//                  errorText: '',
//                  helperText: '',
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
              new Container(
                width: 350.0,
                child: new TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Your login password",
                    prefixIcon: Icon(Icons.lock),
//                  labelText: '',
//                  errorText: '',
//                  helperText: '',
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
              new Container(
                width: 350.0,
                child: new TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Your login password（2）",
                    prefixIcon: Icon(Icons.lock),
//                  labelText: '',
//                  errorText: '',
//                  helperText: '',
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Container(
                width: 350,
                child: new Padding(
                  padding: new EdgeInsets.only(bottom: 30.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                          height: 20.0,
                          alignment: Alignment.centerRight,
                          child: new FlatButton(
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/signIn')},
                            child: new Text(
                              'Sign in',
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              new SizedBox(
                width: 350,
                height: 50,
                child: new FlatButton(
                  child: new Text(
                    'Sign Up',
                    style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () =>
                      {Navigator.popAndPushNamed(context, '/basicLayout')},
                  color: Colors.cyan,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

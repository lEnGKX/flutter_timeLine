import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => new _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      backgroundColor: Color.fromRGBO(211,197,180, 1),
      body: new Center(
        child: SingleChildScrollView(
          child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/fire.gif',
                height: 180.0,
                fit: BoxFit.fitHeight,
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 40.0)),
              new Text(
                'Welcome to Timeline',
                style: new TextStyle(
                    fontSize: 25.0,
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
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Container(
                width: 350,
                child: new Padding(
                  padding: new EdgeInsets.only(bottom: 30.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        height: 20.0,
                        alignment: Alignment.centerLeft,
                        child: new FlatButton(
                          onPressed: () => {print('click forget password')},
                          child: new Text(
                            'Forget password?',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ),
                      new Container(
                          height: 20.0,
                          alignment: Alignment.centerRight,
                          child: new FlatButton(
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/signUp')},
                            child: new Text(
                              'Sign Up',
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
                    'Sign in',
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

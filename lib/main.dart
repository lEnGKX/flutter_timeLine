import 'package:flutter/material.dart';
import './routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time line',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RouteConfig.initRouteName,
      onGenerateRoute: RouteConfig.onGenerateRoute,
//      home: MyHomePage(),
    );
  }
}

//class MyHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////        body: new SignIn(),
////        body: new SignUp()
//      body: new HomePage(),
//    );
//  }
//}

import 'package:flutter/material.dart';

import 'package:time_line/http/https.dart';
import 'package:time_line/themes/colorThemes.dart';

import 'package:time_line/components/photoAlbum/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List result;

  @override
  void initState() {
    super.initState();

    Https.getAllPhotoAlbum().then((res) {
      setState(() {
        result = res['photoAlbum'];
      });
    });
  }

  // 渲染相册列表
  Widget renderPhotoAlbumList() {
    List<Widget> photoAlbumList = []; // 先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    if (result != null) {
      for (var item in result) {
        photoAlbumList.add(new PhotoAlbum(data: item));
      }
      content = new Column(
        children: photoAlbumList,
      );
    } else {
      content = new Text('loading');
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
//    print(result);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Hi,Time',style: TextStyle(color: ColorThemes.fColor),),
        backgroundColor:  ColorThemes.ABColor,
      ),
      drawer: new Drawer(
        child: new ListView(
          padding: new EdgeInsets.only(top:100,left:20.0,right: 20.0),
          children: <Widget>[
            new FlatButton(
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, '/signIn')},
              child: new Text('Sign in'),
              color: Colors.blueAccent,
              textColor: Colors.white,
            ),
            new FlatButton(
              onPressed: () =>
                  {Navigator.pushReplacementNamed(context, '/signUp')},
              child: new Text('Sign up'),
              color: Colors.cyan,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      body: new Container(
          padding: new EdgeInsets.only(left: 15.0, right: 15.0),
          child: new SingleChildScrollView(
            child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                new Text('My name is HomePage'),
//                new Text(result),
                renderPhotoAlbumList(),
              ],
            ),
          )),
    );
  }
}

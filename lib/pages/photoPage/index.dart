import 'package:flutter/material.dart';

import 'package:time_line/http/https.dart';
import 'package:time_line/http/apiUrls.dart';
import 'package:time_line/themes/colorThemes.dart';

class PhotoPage extends StatefulWidget {
  final arguments;

  PhotoPage({Key key, this.arguments}) : super(key: key);

  @override
  _PhotoPageState createState() => new _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  var result;

  @override
  void initState() {
    super.initState();
    Https.getPhoto(widget.arguments['albumName'], widget.arguments['photoId'])
        .then((res) {
//      print(res);
      setState(() {
        result = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: ColorThemes.cardBDColor,
        appBar: new AppBar(
          title: new Text(result != null ? result['name'] : '',
              style: TextStyle(color: ColorThemes.fColor)),
          backgroundColor: ColorThemes.ABColor,
        ),
        body: result != null
            ? new Container(
                padding: EdgeInsets.all(10),
                child: new SingleChildScrollView(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
//                      width: 500,
//                      height: 300,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
//                      image: DecorationImage(
//                        fit: BoxFit.fitHeight,
//                        image: NetworkImage(
//                            'https://cdn.jsdelivr.net/gh/lEnGKX/PicGo_o@master/data/20200804101556.png'),
//                      )
                        ),
                        child: Image.network(
                            '${ApiUrls.IMG_BASE_URL}${result['imageUrl']}'),
                      ),
                      new Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: new Text(
                          result['name'],
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      new Container(
//                  color: Colors.black38,
                        padding: EdgeInsets.only(bottom: 30),
                        child: new Text(result['introduction']),
                      ),
                      new Container(
//                  width: 500,
//                  color: Colors.blue,
                        child: new Text(
                          '-- 我是时间 --',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : new Text('loading...'));
  }
}

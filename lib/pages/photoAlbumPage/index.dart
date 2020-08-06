import 'package:flutter/material.dart';

import 'package:time_line/http/https.dart';
import 'package:time_line/themes/colorThemes.dart';

import 'package:time_line/components/photoAlbumListItem/index.dart';

class PhotoAlbumPage extends StatefulWidget {
  PhotoAlbumPage({Key key, this.arguments}) : super(key: key);

  final Map arguments;

  @override
  _PhotoAlbumPageState createState() => new _PhotoAlbumPageState();
}

class _PhotoAlbumPageState extends State<PhotoAlbumPage> {
  var result;

  @override
  void initState() {
    super.initState();
//    print('arguments -- ${widget.arguments}');
    Https.getPhotoAlbum(widget.arguments['albumName']).then((res) {
      setState(() {
        result = res;
      });
    });
  }

  Widget renderAlbumList() {
    List<Widget> albumList = [];
    Widget content;
    if (result != null) {
      for (var item in result['photos']) {
        var props = {'photoInfo': item, 'albumName': result['albumName']};
        albumList.add(new PhotoAlbumListItem(props: props));
      }
      content = new Column(
        children: albumList,
      );
    } else {
      content = new Text('loading...');
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(result != null ? result['albumName'] : '',style: TextStyle(color: ColorThemes.fColor)),
        backgroundColor: ColorThemes.ABColor,
      ),
      body: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: new SingleChildScrollView(
          child: renderAlbumList(),
        ),
      ),
    );
  }
}

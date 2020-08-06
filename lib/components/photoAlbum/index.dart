import 'package:flutter/material.dart';

import 'package:time_line/themes/colorThemes.dart';
import 'package:time_line/http/apiUrls.dart';

class PhotoAlbum extends StatefulWidget {
  PhotoAlbum({Key key, this.data}) : super(key: key);
  final data;

  @override
  _PhotoAlbumState createState() => new _PhotoAlbumState();
}

class _PhotoAlbumState extends State<PhotoAlbum> {
  // 跳转到指定相册路由
  void skipRouteAlbum(String albumName) {
    print(albumName);
    Navigator.pushNamed(context, "/photoAlbum",
      arguments: {'albumName': albumName});
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
//      height: 230,
      padding: new EdgeInsets.all(10.0),
      margin: new EdgeInsets.only(top: 10.0),
      decoration: new BoxDecoration(
          color:ColorThemes.cardBDColor,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () => skipRouteAlbum(widget.data['albumName']),
            child: new Container(
              height: 200,
              decoration: new BoxDecoration(
                  color: ColorThemes.imgBDColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          '${ApiUrls.IMG_BASE_URL}${widget
                              .data['photos'][0]['imageUrl']}'))),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 8.0, left: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  widget.data['albumName'],
                  style: new TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                new IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.more_vert),
                  onPressed: null,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

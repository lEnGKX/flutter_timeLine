import 'package:flutter/material.dart';

import 'package:time_line/themes/colorThemes.dart';
import 'package:time_line/http/apiUrls.dart';

class PhotoAlbumListItem extends StatefulWidget {
  final props;
  PhotoAlbumListItem({Key key, this.props}) : super(key: key);

  @override
  _PhotoAlbumListItemState createState() => new _PhotoAlbumListItemState();
}

class _PhotoAlbumListItemState extends State<PhotoAlbumListItem> {

  // 跳转 photo 详情路由
  void skipPhotoPage(){
//    print(widget.props);
    Navigator.pushNamed(context, '/photoPage',arguments:{
      'photoId':widget.props['photoInfo']['id'],
      'albumName':widget.props['albumName']
    });
  }


  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => skipPhotoPage(),
      child: new Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: ColorThemes.cardBDColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 140,
              height: 100,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: ColorThemes.imgBDColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          '${ApiUrls.IMG_BASE_URL}${widget.props['photoInfo']['imageUrl']}'))),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: 170,
                  padding: EdgeInsets.only(bottom: 5),
                  child: new Text(
                    widget.props['photoInfo']['name'],
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                    width: 170,
                    child: new Text(widget.props['photoInfo']['introduction'],
                        overflow: TextOverflow.ellipsis)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

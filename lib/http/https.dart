import 'package:time_line/http/HttpUtils.dart';
import './apiUrls.dart';

class Https {
  // 获取全部相册
  static getAllPhotoAlbum() async {
    Map<String, dynamic> result =
        await DioUtils().get(ApiUrls.allPhotoAlbumApi);
    return result;
  }

  // 获取指定相册
  static getPhotoAlbum(String albumName) async {
//    print('${ApiUrls.allPhotoAlbumApi}?albumName=$albumName');
    Map<String, dynamic> result =
        await DioUtils().get('${ApiUrls.allPhotoAlbumApi}?albumName=$albumName');
    return result['albumName'];
  }

  // 获取指定相片
  static getPhoto(String albumName,String photoId) async {
    print('${ApiUrls.allPhotoAlbumApi}?albumName=$albumName&photoId=$photoId');
    Map<String, dynamic> result =
    await DioUtils().get('${ApiUrls.allPhotoAlbumApi}?albumName=$albumName&photoId=$photoId');
    return result['photo'];
  }

}

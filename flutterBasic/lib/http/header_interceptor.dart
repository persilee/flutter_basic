import 'package:dio/dio.dart';
import 'package:flutter_basic/utils/hive_store.dart';
import 'package:flutter_basic/utils/language.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    int urlType = Boxes.appConfigBox.get(ConfigKey.URL_TYPE, defaultValue: 1);
    String baseUrl = '';
    switch (urlType) {
      case 1: //dev
        baseUrl = 'http://192.168.200.109:8303';
        break;
      case 2: //sit
        baseUrl = 'http://192.168.201.83:5040';
        break;
      case 3: //UAT
        baseUrl = 'http://192.168.201.83:5040';
        break;
      default:
    }

    // String token =
    //     Boxes.userSecretConfigBox.get(ConfigKey.NET_TOKEN, defaultValue: '');

    //获取动态Key和IV
    // options.extra['key'] = EncryptUtil.generateRandomString();
    // options.extra['iv'] = EncryptUtil.generateRandomString();
    // print('key:${options.extra['key']}');
    // print('iv:${options.extra['iv']}');

    //1,先把aes进行加密转码
    // String kIVStringAES =
    //     await EncryptUtil.getInstance().rsaDataEncode(options.extra['iv']);
    // String kKeyStringAES =
    //     await EncryptUtil.getInstance().rsaDataEncode(options.extra['key']);
    // print('kKeyStringAES===>$kKeyStringAES');
    // print('kIVStringAES===>$kIVStringAES');
    options.baseUrl = baseUrl;
    // options.headers.addAll({'x-kont-key': kKeyStringAES});
    // options.headers.addAll({'x-kont-iv': kIVStringAES});
    options.headers.addAll({'Accept-Language': Language.getSaveLanguage()});
    options.headers.addAll({
      'Access-Token': Boxes.userSecretConfigBox
          .get(ConfigKey.ACCESS_TOKEN, defaultValue: '')
    });
    options.headers.addAll({
      'Access-UID':
          Boxes.userSecretConfigBox.get(ConfigKey.ACCESS_UID, defaultValue: '')
    });

    super.onRequest(options, handler);
  }
}

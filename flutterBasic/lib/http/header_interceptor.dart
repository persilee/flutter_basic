import 'package:dio/dio.dart';
import 'package:flutter_basic/utils/encrypt_util.dart';
import 'package:flutter_basic/utils/hive_store.dart';
import 'package:flutter_basic/utils/language.dart';

class HeaderInterceptor extends Interceptor {
  static const XKONTAPPKEY = '6000000514984257';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    int urlType = Boxes.appConfigBox.get(ConfigKey.URL_TYPE, defaultValue: 1);
    String baseUrl = '';
    switch (urlType) {
      case 1: //dev
        baseUrl = 'http://192.168.201.83:5040/';
        break;
      case 2: //sit
        baseUrl = 'http://192.168.201.83:5040/';
        break;
      case 3: //UAT
        baseUrl = 'http://192.168.201.83:5040/';
        break;
      default:
    }

    String token =
        Boxes.userSecretConfigBox.get(ConfigKey.NET_TOKEN, defaultValue: '');

    //获取动态Key和IV
    options.extra['key'] = EncryptUtil.generateRandomString();
    options.extra['iv'] = EncryptUtil.generateRandomString();
    // print('key:${options.extra['key']}');
    // print('iv:${options.extra['iv']}');

    //1,先把aes进行加密转码
    String kIVStringAES =
        await EncryptUtil.getInstance().rsaDataEncode(options.extra['iv']);
    String kKeyStringAES =
        await EncryptUtil.getInstance().rsaDataEncode(options.extra['key']);
    // print('kKeyStringAES===>$kKeyStringAES');
    // print('kIVStringAES===>$kIVStringAES');
    options.baseUrl = baseUrl;
    options.headers.addAll({'x-kont-appkey': '6000000514984255'});
    options.headers.addAll({'x-kont-token': token});
    options.headers.addAll({'x-kont-key': kKeyStringAES});
    options.headers.addAll({'x-kont-iv': kIVStringAES});
    options.headers.addAll({'x-kont-locale': Language.getSaveLanguage()});
    options.headers.addAll({'x-kont-channel': 'MBS'});
    options.headers.addAll({
      'x-kont-userid':
          Boxes.userConfigBox.get(ConfigKey.USER_ID, defaultValue: '')
    });

    super.onRequest(options, handler);
  }
}

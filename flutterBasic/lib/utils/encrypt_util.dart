import 'dart:math';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

class EncryptUtil {
  // static const String kKeyStringAES = "APD-Req-Rsp-kKey";
  // static String kIVStringAES = "APD-Req-Rsp-kIVs";

  // static const String kPathPrivateDevPemDev = "assets/data/private.pem";
  // static const String kPathPublicDevPemDev = "assets/data/public.pem";

  static EncryptUtil? _instance;

  EncryptUtil._internal();

  static EncryptUtil getInstance() {
    _instance ??= EncryptUtil._internal();

    return _instance!;
  }

  //aes加密
  String aesEncode(String content, String kKeyStringAES, String kIVStringAES) {
    // print("aesEncode-kKeyStringAES: $kKeyStringAES");
    // print("aesEncode-kIVStringAES: $kIVStringAES");
    try {
      final key = Key.fromUtf8(kKeyStringAES);
      final iv = IV.fromUtf8(kIVStringAES);

      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
      final encrypted = encrypter.encrypt(content, iv: iv);

      return encrypted.base64;
    } catch (err) {
      print("aes encode error:$err");
      return content;
    }
  }

  //aes解密
  String aesDecode(String content, String kKeyStringAES, String kIVStringAES) {
    // print("aesDecode-kKeyStringAES: $kKeyStringAES");
    // print("aesDecode-kIVStringAES: $kIVStringAES");
    try {
      final key = Key.fromUtf8(kKeyStringAES);
      final iv = IV.fromUtf8(kIVStringAES);

      final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

      final decrypted =
          encrypter.decrypt64(content.replaceAll('"', ''), iv: iv);
      return decrypted;
    } catch (err) {
      print("aes decode error:$err");
      return content;
    }
  }

  //RSA加密
  Future<String> rsaDataEncode(String content) async {
    try {
      final publicKey = await parseKeyFromFileHSG<RSAPublicKey>(
          "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCOsD7MqrLafG515GS6TV/zRV9RVPSC/BUNLGzTBx0dwzyLJMQ/Oq0aRjytgfyu4VBvW2pxsVkXalQuSeDfNJeEksCUpTIss2FadXpUGkfxOiuTH3G8DDbMfQQ7odcsatqiXMwyf1kiVDYjhCp2YJ1S/ZuxtxWTWsOEB7Gai2U8uwIDAQAB\n-----END PUBLIC KEY-----\n");

      final encrypter = Encrypter(RSA(publicKey: publicKey));
      final encrypted = encrypter.encrypt(content);

      return encrypted.base64;
    } catch (err) {
      print("rsa encode error:$err");
      return 'error';
    }
  }

  //RSA解密
  Future<String> rsaDataDecode(String content) async {
    try {
      final privateKey = await parseKeyFromFileHSG<RSAPrivateKey>(
          '-----BEGIN PRIVATE KEY-----\nMIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKXEDvr18KUU94zgbPBY9pYCjX4pw2b9JcNA0N6pyOf6qz5x32PlfJzI9zNJlknr2bitAHjJME4NW+jbxKxzFnrs63KgHLtwCUB1T4mFxL0eeIaxZW+kKDrgXohD3BrZB0Rt7NcvuQLyyzhFVOnq9A4PfZyHrF/O7g2u+TzFJPfhAgMBAAECgYAcoyRbYsWyH08s/VCUrSncfJBpLVnenvk5JCdxcC+PNBUFcrK/FVRT2bwrFhlqp94zM2ATfd5kfZZVQjJWAIPvbXLJL8UJO7iX6cm4p5KdWyFjdyZsojgT/otjIQznjqU9/hX0SVQHql5Y+U827axYuRpTmwjHQUILxy3Y7y8AAQJBANF+GgiWvSd1dusZp1UQPTW5FU1snNoj9Ie+p+lAeVlk1xgYv5x2jF3Y7asjlqw+oETSdrNY79Qc0FCE1hdQt+ECQQDKkOA+kTsW7YPvYTIofcKpgtUXmFM/2Sx3HjAdd6p2b7gaF4JcIJHXbAsHQ1z+JgWdBCDHbdchLl97z+HLXEABAkAE5ns7ajNAggnnE/GLFtcns42hAwJkQ+ULa9VHqn9sLOSvJp0MzuUXqOReVXXHz6s2EOo/5buubYId8A2F/BhhAkEAj3pWm3qa8/6AOQoLUQri2tZEwVWvgcX97NGBGx4rq4AuUqzcNQ0MwB1TIm3gbFPaHgFShm+StXn3P+da84QAAQJBAIDAw/THEORaz+HFYs5kPLu7ZgQ+RWfYiYHiu3Uw0+oPjZpprsCUeTCG44+Sg2WaN/+fr5kMeJlYrQ5sGVX63FM=\n-----END PRIVATE KEY-----\n');
      final encrypter = Encrypter(RSA(privateKey: privateKey));
      final encrypted = encrypter.decrypt(Encrypted.fromBase64(content));

      return encrypted;
    } catch (err) {
      print("rsa decode error:$err");
      return 'error';
    }
  }

  static String generateRandomString({int len = 16}) {
    final _random = Random();
    final result = String.fromCharCodes(
        List.generate(len, (index) => _random.nextInt(33) + 89));
    return result;
  }

  Future<T> parseKeyFromFileHSG<T extends RSAAsymmetricKey>(
      String pemKey) async {
    final key = pemKey;
    final parser = RSAKeyParser();
    return parser.parse(key) as T;
  }
}

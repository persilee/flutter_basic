import 'package:hive/hive.dart';

class Boxes {
  static const _appConfigBox = 'appConfigBox';
  static const _userConfigBox = 'userConfigBox';
  static const _userSecretConfigBox = 'userSecretConfigBox';

  static registerBoxes() {}

  static openBoxes() async {
    await Hive.openBox(_appConfigBox);
    await Hive.openBox(_userConfigBox);
    await Hive.openBox(_userSecretConfigBox);
  }

  static closeBoxes() {
    Hive.close();
  }

  static Box get appConfigBox => Hive.box(_appConfigBox);
  static Box get userConfigBox => Hive.box(_userConfigBox);
  static Box get userSecretConfigBox => Hive.box(_userSecretConfigBox);
}

class ConfigKey {
  /// config key for app preference
  static const LANGUAGE = "language";
  static const URL_TYPE = "url_type";

  /// config key for user preference
  static const USER_ID = "user_id";
  static const USER_ACCOUNT = "user_account";

  /// config key for user secret preference
  static const NET_TOKEN = "net_token";
}

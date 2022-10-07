import 'package:hive/hive.dart';

class Boxes {
  static const _appConfigBox = 'appConfigBox';
  static const _userConfigBox = 'userConfigBox';

  static registerBoxes() {}

  static openBoxes() async {
    await Hive.openBox(_appConfigBox);
    await Hive.openBox(_userConfigBox);
  }

  static closeBoxes() {
    Hive.close();
  }

  static Box get appConfigBox => Hive.box(_appConfigBox);
  static Box get userConfigBox => Hive.box(_userConfigBox);
}

class ConfigKey {
  /// config key for app preference
  static const LANGUAGE = "language";
}
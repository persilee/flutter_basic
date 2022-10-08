import 'package:flutter_basic/utils/hive_store.dart';

class BaseBody {
  String? userId;
  String? loginName;
  String? channel;
  dynamic body;

  BaseBody({required this.body, this.userId, this.loginName}) {
    final box = Boxes.userConfigBox;
    userId = box.get(ConfigKey.USER_ID);
    loginName = box.get(ConfigKey.USER_ACCOUNT);
    channel = "MBS";
  }

  BaseBody.fromJson(dynamic json) {
    userId = json["userId"];
    loginName = json["loginName"];
    channel = json["channel"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() => {
        "loginName": loginName,
        "userId": userId,
        "channel": channel,
        "body": body,
      };
}

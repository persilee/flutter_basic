import 'package:intl/intl.dart';
import 'package:one_pay/utils/hive_store.dart';

///用户订单编号生成规则
class OrderGeneratFile {
  String creatOrderIdNo() {
    String order = '';

    ///登录返回的用户编号从第6位开始截取+时间戳，因为后台的数据库字段长度是32位。所以需要进行一个截取
    String? userNo =
        Boxes.userSecretConfigBox.get(ConfigKey.UserNumber, defaultValue: '');
    String subString = userNo!.substring(6);
    String? _timeStr = DateFormat('yyyyMMddHHmmssSSS').format(DateTime.now());

    order = subString + _timeStr;
    return order;
  }
}

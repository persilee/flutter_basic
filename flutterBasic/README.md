## JSON 数据的序列化与反序列化

对于每个网络请求或者其他需要用到 Json 序列化/反序列化的类，按以下步骤进行编写。

1.进入项目根目录，在终端或命令行中运行：

```bash
# 一次性生成
flutter pub run build_runner build

# 持续生成
flutter packages pub run build_runner watch
```

若执行 `flutter pub run build_runner build `后报 **code 78** 错误，则运行可运行以下命令(二选一)：

```bash
# 1.
flutter packages pub run build_runner clean

# 2.
flutter packages pub run build_runner build --delete-conflicting-outputs
```

以上方法会解决大部分错误。

2.定义完实体和属性，对类声明注解`@JsonSerializable()`，然后手动编写序列化与序列化代码，调用插件生成的方法，序列化调用`_$XXXToJson()`方法，反序列化调用`_$XXXFromJson()`方法。如：

```Dart
import 'package:json_annotation/json_annotation.dart';
/// 手动输入这行xxx(文件名).g.dart
part 'login.g.dart';

/// 对象实体定义
@JsonSerializable()
class LoginResp {
  String userId;
  String custId;
  String userAccount;
  String headPortrait;
  String actualName;
  String userPhone;

  /// 默认构造方法给_$LoginRespFromJson使用
  LoginResp(this.userId, this.custId, this.userAccount, this.headPortrait,
      this.actualName, this.userPhone);

  factory LoginResp.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginRespToJson(this);
}

/// 调用
Future<LoginResp> login(LoginReq loginReq, String tag) {
    return request(
        'security/cutlogin', loginReq, tag, (data) => LoginResp.fromJson(data));
  }

```

3.另外，为了方便将 json 数据转换成实体类型，可以使用**转换工具**，比如：[点击这里](https://caijinglong.github.io/json2dart/index_ch.html)。
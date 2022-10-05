import 'dart:async';

void main() async {
  // 第一调用方法
  _getData().then((value) => print(value)); // successful!

  // 第二种调用方法
  var str1 = await _getData();
  print('str1: $str1'); // 3秒之后输出 ： str1: successful!

  // 异常处理
  //第一种写法
  _getData().then((value) => print(value)).catchError((error) => print(error));

  // 第二种写法
  try {
    var str2 = await _getData();
    print('str2: $str1'); // 3秒之后输出 ： str2: successful!
  } catch (e) {
    print(e);
  }
}

Future<String> _getData() async {
  print('waiting...');
  return Future.delayed(Duration(seconds: 3), () => 'successful!');
}

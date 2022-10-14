void main() {
  /// 数字类型
  _numType();

  /// 字符串类型
  _stringType();

  /// 布尔类型
  _boolType();

  /// 列表
  _listType();

  /// 集合
  _setType();

  /// Map
  _mapType();

  /// 关键字 var，final, const
  _varFinalConst();
}

void _varFinalConst() {
  var apple;
  apple = '🍎';
  print('apple type: ${apple.runtimeType}'); // String
  apple = 1.2;
  print('apple type: ${apple.runtimeType}'); // double

  // final orange;
  // orange = '🍊';
  // print('orange type: ${orange.runtimeType}'); // String
  //orange = '🍎'; // error: The final variable 'orange' can only be set once.

  //const grapes; // error: The constant 'grapes' must be initialized.
  const grapes = '🍇';
  //grapes = '🍉'; // error: Constant variables can't be assigned a value.
  print('grapes type: ${grapes.runtimeType}'); // String
}

void _mapType() {
  /// map的定义
  Map map1 = {'dog': '🐶', 'cat': '🐱', 'pig': '🐷'};
  print('map1: $map1'); // {dog: 🐶, cat: 🐱, pig: 🐷}

  /// map的常用方法
  map1.addAll({'tiger': '🐯'});
  print('map1: $map1'); // {dog: 🐶, cat: 🐱, pig: 🐷, tiger: 🐯}
  map1.remove('pig');
  print('map1: $map1'); // {dog: 🐶, cat: 🐱, tiger: 🐯}
  print('keys: ${map1.keys}'); // dog, cat, tiger
  print('values: ${map1.values}'); // 🐶, 🐱, 🐯

  /// map的遍历
  map1.forEach((key, value) => print('key: $key, value: $value'));
  Map map2 = map1.map((key, value) => MapEntry(value, key));
  print('map2: $map2'); // {🐶: dog, 🐱: cat, 🐯: tiger}
}

void _setType() {
  /// 集合的定义
  Set set1 = {'🍓', '🍇', '🍊'};
  print('set1: $set1'); // {🍓, 🍇, 🍊}

  /// 集合常用方法
  set1.add('🍉');
  set1.add('🍓');
  print(
      'set1 add: $set1'); // {🍓, 🍇, 🍊, 🍉}：新增的🍓没有成功，因为，集合中的元素是唯一的（列表中的元素是可以重复的）。
  set1.remove('🍓');
  print('set1 remove: $set1'); // 🍇, 🍊, 🍉

  /// 集合的遍历
  for (var i in set1) {
    print(i); //🍓, 🍇, 🍊, 🍉
  }
  set1.forEach((element) => print(element));
}

void _listType() {
  /// 列表的定义
  List list1 = [1, 2, 3, '四', 5];
  print('list: $list1'); //[1, 2, 3, 四, 5]

  /// int类型的列表定义
  List<int> list2 = [6, 7, 8];
  print('list int: $list2'); // [6, 7, 8]

  /// 列表常用方法
  List list3 = [];
  list3.add('🍒'); // 添加元素
  list3.add('🍒'); // 添加元素
  print('list3: $list3'); // [🍒, 🍒] 元素可以重复
  list3.addAll(list2); // 添加一个列表
  print('list addAll: $list3'); // [🍒, 🍒, 6, 7, 8]
  list3.remove('🍒'); // 删除一个元素
  print('list remove: $list3'); // [🍒, 6, 7, 8]

  /// 生成一个列表
  List list4 = List.generate(10, (index) => index + 1);
  print('list4: $list4'); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  /// 列表的遍历
  for (var i = 0; i < list4.length; i++) {
    print(list4[i]); // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  }
  for (var i in list3) {
    print(i); //🍒, 6, 7, 8
  }
  list1.forEach((element) => print(element)); // 1, 2, 3, 四, 5
}

void _boolType() {
  /// 布尔类型的定义
  bool successful = true, failed = false;
  print('success: $successful');
  print('fail: $failed');
  print(successful || failed); // true
  print(successful && failed); // false
}

void _stringType() {
  /// 字符串的定义
  String str1 = 'str1';
  String str2 = 'str2', str3 = 'str3';
  String str4 = "str4";
  String str5 = "My name's Lishaoying";

  /// 字符串的拼接
  print('字符串拼接：字符串1：${str1} 字符串2：${str2}');
  print('字符串拼接：' + str5);

  /// 字符串常用方法
  print('substring: ${str1.substring(1, 2)}');
  print('indexOf: ${str2.indexOf('2')}');
}

void _numType() {
  /// 是数字类型的父类
  num num1 = -1.0; //可以是小数
  num num2 = 1; //可以是整数

  /// 整数
  int int1 = 1;

  /// 小数
  double double1 = 6.6;

  print('num1: $num1');
  print('num2: $num2');
  print('int1: $int1');
  print('double1: $double1');

  /// 类型转换
  print('num转换成Int：${num1.toInt()}');
  print('num转换成Double：${num1.toDouble()}');
  print('Int转换成Double：${int1.toDouble()}');
  print('Double转换成Int：${double1.toInt()}');
}

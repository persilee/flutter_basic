---
title: Flutter 基础知识
tags:
  - flutter
  - dart
  - retrofit
copyright: true
comments: true
date: 2022-09-24 16:46:36
categories: Dart
top: 123
photos:
---

{% li https://cdn.lishaoy.net/beautifulFlutter/flutter_750x400.png, flutter app, flutter app %}

博客好久没更新了，由于公司需要我来讲解一些**flutter**相关的基础知识，我需要准备一些资料，就顺便更新一下博客😋。

<!-- more -->

# Dart语言

## Dart 概述

### 强类型语言（OOP）

从 **Dart** 2.0开始，dart就是强类型的语言，是静态类型的语言，和我们熟知的 Java、C#是比较相似的。  
另外，**Dart** 是面向对象的语言（OOP），常见的面向对象的语言有 Python、C++、Java、Kotlin、Swift等。

### JIT 和 AOT

JIT： 在开发期间会及时编译，所以，可以更快的编译和更快的重载。  
AOT：在release版本时，会事前编译（会把代码编译成二进制代码，例如：C和C++），所以运行的更流畅。

## Dart 基础类型

### num类型

```js
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
```

### String 类型

```js
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
```

### bool 类型

```js
  /// 布尔类型的定义
  bool successful = true, failed = false;
  print('success: $successful');
  print('fail: $failed');
  print(successful || failed); // true
  print(successful && failed); // false
```

### List 列表

```js
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
```

### Set 集合

 ```js
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
 ```

 ### Map

 ```js
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
 ```

 ### 关键字var，final，const

 `var`: 声明的变量是一个 **dynamic** 动态类型的值，且值可以修改。

 ```js
  var apple;
  apple = '🍎';
  print('apple type: ${apple.runtimeType}'); // String
  apple = 1.2;
  print('apple type: ${apple.runtimeType}'); // double
 ```

 `final`: 声明的变量是一个 **dynamic** 动态类型的值，且不能修改。

 ```js
  final orange;
  orange = '🍊';
  print('orange type: ${orange.runtimeType}'); // String
  orange = '🍎'; // error: The final variable 'orange' can only be set once.
 ```

 `const`: 声明的是**dynamic** 动态类型的常量，不能修改，且必须初始化。

 ```js
  const grapes; // error: The constant 'grapes' must be initialized.
  const grapes = '🍇';
  grapes = '🍉'; // error: Constant variables can't be assigned a value.
  print('grapes type: ${grapes.runtimeType}'); // String
 ```

## Dart class(类)

 在**Dart**所有的类都是继承自Object。

### 类的定义

 ```js
class Person {
  String? name;
  int? age;

  Person({this.name, this.age});

  @override
  String toString() {
    return 'name: $name, age: $age';
  }
}

var xiaoMing = Person(
  name: 'xiao ming',
  age: 18,
);

print(xiaoMing); // name: xiao ming, age: 18
 ```

### 类的继承 extends

```js
class Student extends Person {
  String _school; // 私有成员变量
  String grade; // 共有成员变量
  String name;

  Student(String name, int age, this._school, {this.grade = '三年级'})
      : name = '$grade $name', // 初始化列表
        super(name, age);
}

var xiaoHong = Student('xiaohong', 18, '中山小学');
print(xiaoHong); // name: 三年级 xiaohong, age: 18
```

### 命名构造方法

命名构造方法可以在创建实例时，实现多个构造方法。

```js
class Student extends Person {
  String _school; // 私有成员变量
  String grade; // 共有成员变量
  int score;
  String name;

  Student(String name, int age, this._school, this.score, {this.grade = '三年级'})
      : name = '$grade $name',
        super(name, age);

  //命名构造方法
  Student.good(String name, int age, this._school,
      {this.grade = '三年级', this.score = 90})
      : name = '$grade $name',
        super(name, age);

  @override
  String toString() {
    return 'name: $name, age: $age, score: $score';
  }
}

var xiaoLiang = Student.good('xiaoliang', 18, '中山小学');
print(xiaoLiang); // name: 三年级 xiaoliang, age: 18, score: 90
```

### 工厂构造方法

```js
class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

var s1 = Singleton();
var s2 = Singleton();
print(identical(s1, s2)); // true
```

### 命名工厂构造方法

```js
class Student extends Person {
  String _school; // 私有成员变量
  String grade; // 共有成员变量
  int score;
  String name;

  Student(String name, int age, this._school, this.score, {this.grade = '三年级'})
      : name = '$grade $name',
        super(name, age);

  //命名构造方法
  Student.good(String name, int age, this._school,
      {this.grade = '三年级', this.score = 90})
      : name = '$grade $name',
        super(name, age);

  //命名工厂构造方法
  factory Student.cls(Student student) {
    return Student(student.name, student.age, student._school, student.score);
  }
```

### 类的 get，set，和静态方法

```js
class Student extends Person {
  String _school; // 私有成员变量
  String grade; // 共有成员变量
  int score;
  String name;

  Student(String name, int age, this._school, this.score, {this.grade = '三年级'})
      : name = '$grade $name',
        super(name, age);

  //命名构造方法
  Student.good(String name, int age, this._school,
      {this.grade = '三年级', this.score = 90})
      : name = '$grade $name',
        super(name, age);

  //命名工厂构造方法
  factory Student.cls(Student student) {
    return Student(student.name, student.age, student._school, student.score);
  }

  // get方法
  String get school => _school;

  // set方法
  set school(String value) {
    _school = value;
  }

  // 静态方法
  static paly() {
    print('在打篮球');
  }

  @override
  String toString() {
    return 'name: $name, age: $age, score: $score';
  }
}
```

### 抽象类和抽象方法

```js
class DartStudy implements Study {
  @override
  void study() {
    print('I\'m learning dart');
  }
}

// 定义抽象类
abstract class Study {
  //定义抽象方法
  void study();
}

var study = DartStudy();
study.study(); // I'm learning dart
```

### 混入 mixins

要实现 `mixins`，被 `with` 的类必须是继承Object类的子类，且不能有构造方法和使用super。

继承（关键字 extends）  
混入 mixins （关键字 with）  
接口实现（关键字 implements）  
这三种关系可以同时存在，但是有前后顺序：extends -> mixins -> implements

```js
class SportsPerson extends Person with Play {
  SportsPerson(String name, int age) : super(name, age);
}

class Play {
  void playBasketball() {
    print('正在打🏀');
  }

  void playFootball() {
    print('正在踢⚽️');
  }
}

var xiaoHu = SportsPerson('xiao hu', 18);
xiaoHu.playBasketball(); // 正在打🏀
xiaoHu.playFootball(); // 正在踢⚽️
```

## 泛型

### 泛型类

```js
class PrimaryStudent<T> {
  T primaryStudent;

  PrimaryStudent(this.primaryStudent);
}

var xiaoXiao = PrimaryStudent('小学生');
print(xiaoXiao.primaryStudent); // 小学生
```

### 泛型类的类型约束

```js
class MiddleStudent<T extends Student> {
  T middleStudent;

  MiddleStudent(this.middleStudent);
}

var xiaoHei = MiddleStudent(Student('xiaohei', 9, '中心小学', 66));
print(xiaoHei.middleStudent); // name: 三年级 xiaohei, age: 9, score: 66
```

## 方法 Function

```js
/// 定义一个方法
num _sum(num num1, num num2) {
  return num1 + num2;
}

var sum = _sum(6.6, 1);
print('sum: $sum'); // 7.6
```

### 匿名方法

```js
// 定义一个匿名方法
var _add = (x, y) => print('x + y: ${x + y}');
_add(6, 6); // 12
_add('🍒', '🍓'); // 🍒🍓

((x, y) => print('x + y: ${x + y}'))(3, 4); // 7
```

### 可选参数方法

```js
// 定义一个可选参数方法
void _printUser1(String name, [int? age]) {
  print('user info: $name $age');
}

 _printUser1('xiao hong', 18); // user info: xiao hong 18
```

### 默认值方法

```js
// 定义一个默认值方法
void _printUser2(String name, [int age = 18]) {
  print('user info: $name $age');
}

_printUser2('xiao ming'); // user info: xiao ming 18
```

### 命名参数方法

```js
/// 定义一个命名参数方法
void _printUser3({
  required String name,
  int age = 18,
  String? gender,
}) {
  print('user info: $name $age $gender');
}

_printUser3(name: 'xiao fang', gender: 'female'); // user info: xiao fang 18 female
```

### 方法参数方法

```js
/// 定义一个方法参数方法
void _printUser4({
  required String name,
  int age = 18,
  String? gender,
  Function? callBack,
}) {
  print('user info: $name $age $gender');
  callBack?.call();
}

_printUser4(
  name: 'xiao hu',
  gender: 'male',
  callBack: () => print('he likes playing 🏀'),
); // user info: xiao hu 18 male he likes playing 🏀
```

## 空安全

空安全在代码编辑阶段帮助我们提前发现可能出现的空异常问题。

### 非空类型和可空类型

```js
// 非空类型
String s1 = null; // Error: The value 'null' can't be assigned to a variable of type 'String' because 'String' is not nullable.
print('a: $s1');

// 可空类型
String? s2 = null;
print('s2: $s2'); // s2: null
```

### 空断言操作符

通过添加空断言操作符 `!` 在表达式之后，可以将其赋值给一个非空变量

```js
// 空断言操作符
List<int?> list1 = [1, 2, 3];
print('list1: ${list1.first!.isOdd}'); // list1: true
```

### ?? 操作符

通过操作符 `??` 来设置默认值。

```js
int addOne1(int x) {
  return x + 1;
}
int? i;
addOne1(i ?? 1);
```

## 异步方法

### 异步方法定义和调用

```js
Future<String> _getData() async {
  print('waiting...');
  return Future.delayed(Duration(seconds: 3), () => 'successful!');
}

// 第一调用方法
_getData().then((value) => print(value)); // successful!

// 第二种调用方法
var str1 = await _getData();
print('str1: $str1'); // 3秒之后输出 ： str1: successful!
```

### 异步方法异常处理

```js
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
```

# Flutter框架


## Flutter初识

### Flutter介绍

**Flutter** 是 Google 推出并开源的移动应用开发框架，主打跨平台、高保真、高性能。开发者可以通过 Dart 语言开发 App，一套代码同时运行在 iOS 和 Android平台。

### Flutter框架结构

这个是**Flutter**官方提供的框架图：

![Framework](https://cdn.lishaoy.net/flutterBasic/framework.png)

Flutter 从上到下可以分为三层：框架层、引擎层和嵌入层，下面我们分别介绍：

- 框架层：Framework，即框架层。这是一个纯 Dart实现的 SDK，它实现了一套基础库。
- 引擎层：Engine，即引擎层。毫无疑问是 Flutter 的核心， 该层主要是 C++ 实现，其中包括了 **Skia** 引擎、Dart 运行时、文字排版引擎等。
- 嵌入层：Embedder，即嵌入层。Flutter 最终渲染、交互是要依赖其所在平台的操作系统 API，嵌入层主要是将 Flutter 引擎安到特定平台上。

## 创建Flutter项目

```js
flutter create pro_name
// or
flutter create --org com.example pro_name
```

或者可以是使用编辑器创建Flutter项目。

## 包管理

一个 **App** 在实际开发中往往会依赖很多包，而这些包通常都有交叉依赖关系、版本依赖等，如果由开发者手动来管理应用中的依赖包将会非常麻烦。因此，Flutter 使用配置文件`pubspec.yaml`（位于项目根目录）来管理第三方依赖包。

```yaml
name: flutter_basic
description: A new Flutter project.
version: 1.0.0+1
dependencies:
  flutter:
    sdk: flutter
dev_dependencies:
  flutter_test:
    sdk: flutter
flutter:
  uses-material-design: true
```

- name：应用或包名称。
- description: 应用或包的描述、简介。
- version：应用或包的版本号。
- dependencies：应用或包依赖的其他包或插件。
- dev_dependencies：开发环境依赖的工具包（而不是flutter应用本身依赖的包）。
- flutter：flutter相关的配置选项。

## 基础组件

### 
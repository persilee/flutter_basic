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

### MaterialApp

我们会是`MaterialApp`来构建APP的基础架构，以下是一些常用的属性：

| 名称                       | 说明                                                         |
| -------------------------- | ------------------------------------------------------------ |
| debugShowCheckedModeBanner | 当为true时，在debug模式下显示右上角的debug字样的横幅，false即为不显示 |
| theme                      | 主题                                                         |
| darkTheme                  | 暗色主题                                                     |
| themeMode                  | 主题模式，一般用在手动切换APP主题时用到                      |
| initialRoute               | 初始路由                                                  |
| routes                     | 注册的路由表                                                 |
| navigatorObservers         | 路由观察器，当调用Navigator的相关方法时，会回调相关的操作    |
| onGenerateRoute            | 当通过Navigation.of(context).pushNamed跳转路由时， 在routes查找不到时，会调用该方法 |
| localizationsDelegates     | 本地化委托                                                   |
| localeResolutionCallback   | 设置语言时回调                                               |
| supportedLocales           | 设置语言数组                                                 |

### Scaffold

`Scaffold` 是页面的基本结构，我们可以使用它快速的开发出一个页面。

| 名称                 | 说明       |
| -------------------- | ---------- |
| appBar               | 顶部导航栏 |
| drawer               | 抽屉菜单   |
| bottomNavigationBar  | 底部导航栏 |
| floatingActionButton | 漂浮按钮   |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({Key? key}) : super(key: key);

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Page Scaffold'),
      ),
      body: const Center(
        child: Text('This is body.'),
      ),
      drawer: _buildDrawer(context),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.view_headline_rounded),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
```

### AppBar

`AppBar`是一个顶部导航栏，有以下常用属性：

| 名称               | 说明                                                         |
| ------------------ | ------------------------------------------------------------ |
| leading            | 在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮 |
| title              | 标题文字                                                     |
| actions            | 代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示 |
| elevation          | 底部的阴影                                                   |
| backgroundColor    | 背景颜色                                                     |
| systemOverlayStyle | 状态栏主题                                                   |

```js
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageAppBar extends StatefulWidget {
  const PageAppBar({Key? key}) : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  String _selected = '';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('App Bar'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        actions: <Widget>[
          // 非隐藏的菜单
          IconButton(
              icon: const Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {}),
          // 隐藏的菜单
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              _selectView(Icons.message, 'Message', 'A'),
              _selectView(Icons.group_add, 'Service', 'B'),
              _selectView(Icons.cast_connected, 'QRCode', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              setState(() {
                _selected = 'Selected $action';
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          _selected == '' ? 'This is body' : _selected,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  _selectView(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
        value: id,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, color: Colors.blue),
            Text(text),
          ],
        ));
  }
}
```

### Text

`Text`的常用属性，如下：

| 名称            | 说明                                                         |
| --------------- | ------------------------------------------------------------ |
| textAlign       | 文本的对齐方式                                               |
| maxLines        | 指定文本显示的最大行数                                       |
| overflow        | 可以通过`overflow`来指定截断方式，默认是直接截断             |
| textScaleFactor | 代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式`style`属性的`fontSize`，它是调整字体大小的一个快捷方式 |
| style           | `TextStyle`用于指定文本显示的样式如颜色、字体、粗细、背景等  |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageText extends StatefulWidget {
  const PageText({Key? key}) : super(key: key);

  @override
  State<PageText> createState() => _PageTextState();
}

class _PageTextState extends State<PageText> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Text'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Hello world",
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: Paint()..color = Colors.blueAccent,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Home: "),
                    TextSpan(
                      text: "https://flutterchina.club",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Image

我们可以通过`Image`组件来加载并显示图片，`Image`的数据源可以是asset、文件、内存以及网络。

要加载本地图片，我需要在`pubspec.yaml`中的`flutter`部分添加如下内容：

```bash
assets:
  - assets/images/
```

常用属性有，如下：

| 名称      | 说明     |
| --------- | -------- |
| width     | 图片的宽 |
| height    | 图片高度 |
| fit       | 缩放模式 |
| alignment | 对齐方式 |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageImage extends StatefulWidget {
  const PageImage({Key? key}) : super(key: key);

  @override
  State<PageImage> createState() => _PageImageState();
}

class _PageImageState extends State<PageImage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Asset Image',
              style: TextStyle(color: Colors.black),
            ),
            Image.asset(
              'assets/images/icon_logo.png',
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Network Image',
              style: TextStyle(color: Colors.black),
            ),
            Image.network(
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg-blog.csdnimg.cn%2Fimg_convert%2Fa092a42776106d7e76e867d590b971f0.png&refer=http%3A%2F%2Fimg-blog.csdnimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1667644561&t=2d2aab95f8017f8060e82ce58a72166d',
              width: 300.0,
            )
          ],
        ),
      ),
    );
  }
}
```

### Icon

Flutter默认包含了一套Material Design的字体图标，在`pubspec.yaml`文件中的配置如下

```yaml
flutter:
  uses-material-design: true
```

Material Design所有图标可以在其官网查看：https://material.io/tools/icons/

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageIcon extends StatefulWidget {
  const PageIcon({Key? key}) : super(key: key);

  @override
  State<PageIcon> createState() => _PageIconState();
}

class _PageIconState extends State<PageIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Icon'),
      ),
      body: Center(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Icon(Icons.computer, size: 40, color: Color(0xff2D4699)),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.sick, size: 40, color: Color(0xff2D4699)),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.favorite, size: 40, color: Color(0xff2D4699)),
          ],
        ),
      ),
    );
  }
}
```

### Button

Material 组件库中提供了多种按钮组件如`ElevatedButton`、`TextButton`、`IconButton`等。

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_button.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageButton extends StatefulWidget {
  const PageButton({Key? key}) : super(key: key);

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Icon'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("ElevatedButton"),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: const Text("TextButton"),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up, color: Color(0xff2D4699)),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Send"),
              onPressed: () {},
            ),
            CustomButton(
              width: double.infinity,
              text: const Text(
                'Custom Button',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              clickCallback: () {},
            ),
            const CustomButton(
              width: double.infinity,
              text: Text(
                'Custom Button DisEnable',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              isEnable: false,
            ),
            CustomButton(
              width: double.infinity,
              text: const Text(
                'Custom Outline Button',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff465DA9),
                ),
              ),
              isOutline: true,
              clickCallback: () {},
            ),
            const CustomButton(
              width: double.infinity,
              text: Text(
                'Custom Outline Button DisEnable',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff465DA9),
                ),
              ),
              isOutline: true,
              isEnable: false,
            ),
          ],
        ),
      ),
    );
  }
}
```

## 布局组件

布局类组件就是指直接或间接继承(包含)`SingleChildRenderObjectWidget` 和`MultiChildRenderObjectWidget`的Widget，它们一般都会有一个`child`或`children`属性用于接收子 Widget。

大概的布局流程如下：

1. 上层组件向下层组件传递约束（constraints）条件。
2. 下层组件确定自己的大小，然后告诉上层组件。注意下层组件的大小必须符合父组件的约束。
3. 上层组件确定下层组件相对于自身的偏移和确定自身的大小（大多数情况下会根据子组件的大小来确定自身的大小）。

### Container

我们只需通过一个`Container`组件可以实现同时需要装饰、变换、限制的场景，在开发过程中会经常使用。

常用的属性如下：

| 名称        | 说明               |
| ----------- | ------------------ |
| alignment   | 对齐方式           |
| padding     | 容器内补白         |
| color       | 背景色             |
| decoration  | 装饰器             |
| width       | 容器宽度           |
| height      | 容器高度           |
| constraints | 容器大小的限制条件 |
| margin      | 容器外补白         |
| transform   | 变换               |
| child       | 子组件             |

- 容器的大小可以通过`width`、`height`属性来指定，也可以通过`constraints`来指定；如果它们同时存在时，`width`、`height`优先。实际上Container内部会根据`width`、`height`来生成一个`constraints`。
- `color`和`decoration`是互斥的，如果同时设置它们则会报错！实际上，当指定`color`时，`Container`内会自动创建一个`decoration`。

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageContianer extends StatefulWidget {
  const PageContianer({Key? key}) : super(key: key);

  @override
  State<PageContianer> createState() => _PageContianerState();
}

class _PageContianerState extends State<PageContianer> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Icon'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 100.0),
              constraints: const BoxConstraints.tightFor(
                width: 160.0,
                height: 120.0,
              ), //卡片大小
              decoration: const BoxDecoration(
                //背景装饰
                gradient: LinearGradient(
                  //背景线性渐变
                  colors: [
                    Colors.blueAccent,
                    Color(0xff465DA9),
                    Colors.blue,
                  ],
                  stops: [0, 0.6, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              transform: Matrix4.rotationZ(.3), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: const Text(
                //卡片文字
                'Container',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
```

### SizedBox

`SizedBox`用于给子元素指定固定的宽高，如

```js
SizedBox(
  width: 60.0,
  height: 60.0,
  child: ...
)
```

### Align

`Align` 组件可以调整子组件的位置，常用属性如下：

| 名称         | 说明                           |
| ------------ | ------------------------------ |
| alignment    | 表示子组件在父组件中的起始位置 |
| widthFactor  | 宽缩放因子                     |
| heightFactor | 高缩放因子                     |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageAlign extends StatefulWidget {
  const PageAlign({Key? key}) : super(key: key);

  @override
  State<PageAlign> createState() => _PageAlignState();
}

class _PageAlignState extends State<PageAlign> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Align'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue.shade50,
              child: const Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue.shade50,
              child: const Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: Alignment(2, 0.0),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Column和Row

Column和Row指沿垂直或水平方向排列子组件，有主轴和纵轴之分，如果布局是沿水平方向，那么主轴就是指水平方向，而纵轴即垂直方向；如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。

常用属性如下：

| 名称               | 说明                                                   |
| ------------------ | ------------------------------------------------------ |
| textDirection      | 表示水平方向子组件的布局顺序(是从左往右还是从右往左)   |
| mainAxisSize       | 表示在主轴(水平)方向占用的空间，默认是MainAxisSize.max |
| mainAxisAlignment  | 表示子组件在所占用的水平空间内对齐方式                 |
| crossAxisAlignment | 表示子组件在纵轴方向的对齐方式                         |
| verticalDirection  | 表示纵轴（垂直）的对齐方向                             |
| children           | 子组件数组                                             |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageColumnRow extends StatefulWidget {
  const PageColumnRow({Key? key}) : super(key: key);

  @override
  State<PageColumnRow> createState() => _PageColumnRowState();
}

class _PageColumnRowState extends State<PageColumnRow> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Column And Row'),
      ),
      body: Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Container(
            color: Colors.lightBlue,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: const [
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: const [
              Text(
                " hello world ",
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                " I am Jack ",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

### Flex 和 Expanded

Flex 和 Expanded允许子组件按照一定比例来分配父容器空间。

Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”`Flex`子组件所占用的空间。因为 `Row`和`Column` 都继承自 Flex，所以 Expanded 也可以作为它们的孩子。

`Spacer`的功能是占用指定比例的空间。

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageFlex extends StatefulWidget {
  const PageFlex({Key? key}) : super(key: key);

  @override
  State<PageFlex> createState() => _PageFlexState();
}

class _PageFlexState extends State<PageFlex> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Flex And Expanded'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            //Flex的两个子widget按1：2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 100.0,
                //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.lightBlue,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 130.0,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Stack 和 Positioned

 Positioned可以让子组件根据距父容器四个角的位置来确定自身的位置。Stack允许子组件按照代码中声明的顺序堆叠起来。

Stack的常用属性如下：

| 名称          | 说明                                                         |
| ------------- | ------------------------------------------------------------ |
| alignment     | 此参数决定如何去对齐没有定位（没有使用`Positioned`）或部分定位的子组件 |
| textDirection | 用于确定`alignment`对齐的参考系                              |
| fit           | 此参数用于确定**没有定位**的子组件如何去适应`Stack`的大小    |
| clipBehavior  | 此属性决定对超出`Stack`显示空间的部分如何剪裁                |
| children      | 子组件数组                                                   |

```js
import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageStack extends StatefulWidget {
  const PageStack({Key? key}) : super(key: key);

  @override
  State<PageStack> createState() => _PageStackState();
}

class _PageStackState extends State<PageStack> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Stack And Positioned'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: const Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
```


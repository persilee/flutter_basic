void main() {
  var sum = _sum(6.6, 1);
  print('sum: $sum'); // 7.6

  _add(6, 6); // 12
  _add('🍒', '🍓'); // 🍒🍓

  ((x, y) => print('x + y: ${x + y}'))(3, 4); // 7

  _printUser1('xiao hong', 18); // user info: xiao hong 18
  _printUser2('xiao ming'); // user info: xiao ming 18
  _printUser3(
      name: 'xiao fang', gender: 'female'); // user info: xiao fang 18 female
  _printUser4(
    name: 'xiao hu',
    gender: 'male',
    callBack: () => print('he likes playing 🏀'),
  ); // user info: xiao hu 18 male he likes playing 🏀
}

/// 定义一个方法
num _sum(num num1, num num2) {
  return num1 + num2;
}

// 定义一个匿名方法
var _add = (x, y) => print('x + y: ${x + y}');

// 定义一个可选参数方法
void _printUser1(String name, [int? age]) {
  print('user info: $name $age');
}

// 定义一个默认值方法
void _printUser2(String name, [int age = 18]) {
  print('user info: $name $age');
}

/// 定义一个命名参数方法
void _printUser3({
  required String name,
  int age = 18,
  String? gender,
}) {
  print('user info: $name $age $gender');
}

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

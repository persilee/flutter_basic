void main() {
  var xiaoMing = Person('xiao ming', 18);
  print(xiaoMing); // name: xiao ming, age: 18

  var xiaoHong = Student('xiaohong', 18, '中山小学', 80);
  print(xiaoHong); // name: 三年级 xiaohong, age: 18

  var xiaoLiang = Student.good('xiaoliang', 18, '中山小学');
  print(xiaoLiang); // name: 三年级 xiaoliang, age: 18, score: 90

  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2)); // true

  var study = DartStudy();
  study.study(); // I'm learning dart

  var xiaoHu = SportsPerson('xiao hu', 18);
  xiaoHu.playBasketball(); // 正在打🏀
  xiaoHu.playFootball(); // 正在踢⚽️

  var xiaoXiao = PrimaryStudent('小学生');
  print(xiaoXiao.primaryStudent); // 小学生

  var xiaoHei = MiddleStudent(Student('xiaohei', 9, '中心小学', 66));
  print(xiaoHei.middleStudent); // name: 三年级 xiaohei, age: 9, score: 66
}

class MiddleStudent<T extends Student> {
  T middleStudent;

  MiddleStudent(this.middleStudent);
}

class PrimaryStudent<T> {
  T primaryStudent;

  PrimaryStudent(this.primaryStudent);
}

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

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

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

class Person {
  String name;
  int age;

  Person(
    this.name,
    this.age,
  );

  @override
  String toString() {
    return 'name: $name, age: $age';
  }
}

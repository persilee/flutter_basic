void main() {
  // 非空类型
  // String s1 = null; // Error: The value 'null' can't be assigned to a variable of type 'String' because 'String' is not nullable.
  // print('s1: $s1');

  // 可空类型
  String? s2 = null;
  print('s2: $s2'); // s2: null

  // 空断言操作符
  List<int?> list1 = [1, 2, 3];
  print('list1: ${list1.first!.isOdd}'); // list1: true

  int addOne1(int x) {
    return x + 1;
  }

  // addOne1(null);
  int? i;
  if (i != null) {
    addOne1(i);
  }
  addOne1(i ?? 1);

  int? addOne2(int? x) {
    if (x == null) return null;
    return x + 1;
  }

  addOne2(null);
}

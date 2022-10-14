import 'dart:io';
import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

/// Copyright (c) 2020 深圳高阳寰球科技有限公司
///
/// Author: zhanggenhua
/// Date: 2020-11-13

class FormatUtil {
  /// isEmpty
  static bool isEmpty(String text) {
    return text.isEmpty;
  }

  ///判断是否包含高棉语
  static bool isContainKhmer(String text) {
    RegExp khmerReg = RegExp('[\u1780-\u17FF]');
    return khmerReg.hasMatch(text);
  }

  /// 注意只有文本为单行能使用，将每个字符串之间插入零宽空格，解决TextOverflow.ellipsis，单词省略的问题
  static String breakWord(String word) {
    if (word.isEmpty) {
      return word;
    }
    String breakWord = ' ';
    for (var element in word.runes) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    }
    return breakWord;
  }

  /// 每隔 x位 加 pattern
  static String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text != '' && text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 时间格式转换
  static String formatDateForKH(
    String timeStr, [
    String formatKM = "dd-MM-yyyy",
    String format = "yyyy-MM-dd",
  ]) {
    DateTime _dateTime = DateTime.parse(timeStr);
    String _formatStr = format;
    // String _formatStr =
    //     Language.getLocalLangugeStr() == Language.KM_KH ? formatKM : format;
    return DateFormat(_formatStr).format(_dateTime);
  }

  /// 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text, digit: 3);
  }

  //// 每隔3三位加逗号
  static String formatSringToMoney(String numStr,
      [String? ccy,
      bool isChange = false, //是否根据时区替换点和逗号，false就是固定100,000.00的样式
      bool isHiddenMoney = false //是否将金额变为*
      ]) {
    // if (isEmpty(num)) num = '0';
    // String _formatStr = '###,##0.00;';
    // if (ccy == "JPY") {
    //   _formatStr = '###,##0;';
    // }
    // double numDouble = double.parse(num);

    // NumberFormat numberFormat = NumberFormat(_formatStr);

    // String string = numberFormat.format(numDouble);

    // if (num.contains('-')) {
    //   string = '-$string';
    // }

    // return numStr;

    if (isEmpty(numStr)) {
      numStr = '0';
    } else if (numStr.contains(',')) {
      //将逗号转为.
      numStr = numStr.replaceAll(',', '.').trim();
    }
    String _localName = Platform.localeName == '' ? 'en' : Platform.localeName;
    String _countryCode = '';
    int? _decimalDigits;
    if (ccy == "JPY" || ccy == 'KHR') {
      _decimalDigits = 0;
    } else {
      _decimalDigits = null;
    }
    // return numStr + _localName;
    if (isChange && _localName.contains('_')) {
      _countryCode = Platform.localeName.split('_').last;
      if (_countryCode == 'KH') {
        var numDouble = Decimal.parse(numStr);
        NumberFormat numberFormat = NumberFormat.currency(
            locale: 'km', name: '', decimalDigits: _decimalDigits);
        String string = numberFormat.format(DecimalIntl(numDouble));
        return string;
      }
    }
    var numDouble = Decimal.parse(numStr);
    // NumberFormat numberFormat = NumberFormat('###,##0.00', 'en_US');
    NumberFormat numberFormat = NumberFormat.currency(
        locale: _localName, name: '', decimalDigits: _decimalDigits);

    String string = numberFormat.format(DecimalIntl(numDouble));
    return string;
  }

  /// 去除末尾多余的0，小数点后只显示9位。
  static String removeZeroEnd(String num) {
    String _formatStr = '#.#########';
    double numDouble = double.parse(num);

    NumberFormat numberFormat = NumberFormat(_formatStr);

    String string = numberFormat.format(numDouble);

    if (num.contains('-')) {
      string = '-$string';
    }

    return string;
  }

  ///取小数点后几位
  ///num 数据
  ///location 几位
  static String formatNum(double num, int location, {String? type}) {
    int multiplier = pow(10, location) as int;

    print('multiplier $multiplier');

    num = num * multiplier;

    if (isEmpty(type!) || type == 'round') {
      //round四舍五入
      num = num.roundToDouble() / multiplier;
    } else if (type == 'floor') {
      //floor向下
      num = num.floorToDouble() / multiplier;
    } else {
      //ceil向上
      num = num.ceilToDouble() / multiplier;
    }

    return num.toString();
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object? num,
      {int digit = 3, String pattern = ','}) {
    if (num == null) return '';
    List<String> list = num.toString().split('.');
    String left =
        formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = list[1];
    return '$left.$right';
  }

  /// hideNumber
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern,
      {List<String> defValue = const []}) {
    List<String> list = text.split(pattern);
    return list.isNotEmpty ? list : defValue;
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }

  /// OB要求的时间展示格式
  /// dateTime 必须为时间戳
  static String obDateAndTimeFormat(DateTime dateTime, [bool? isOnlyDate]) {
    String _year = '${dateTime.year}';
    String _month = '${dateTime.month}';
    String _day = '${dateTime.day}';

    if (isOnlyDate == true) {
      return _day + '-' + monthChangeEnShort(_month) + '-' + _year;
    }

    String _time = DateFormat('HH:mm:ss').format(dateTime);
    String _amOrPm = dateTime.hour >= 12 ? 'PM' : 'AM';

    return _day +
        '-' +
        monthChangeEnShort(_month) +
        '-' +
        _year +
        ' ' +
        _time +
        _amOrPm;
  }

  static String monthChangeEnShort(String month) {
    if (month == '' || month == '--') {
      return '--';
    }
    switch (int.parse(month)) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '--';
    }
  }

  static String generateRandomString(int length) {
    final _random = Random();
    const _availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length,
            (index) => _availableChars[_random.nextInt(_availableChars.length)])
        .join();

    return randomString;
  }

  /// 生成多位随机数
  static String _getRandomString(int length, [bool isAddZero = true]) {
    if (length <= 0) {
      return '';
    }
    int _randomInt = Random.secure().nextInt((pow(10, length) as int) - 1);
    String _randomStr = _randomInt.toString();
    if (isAddZero && _randomStr.length < length) {
      String _addZeroStr = '';
      for (var i = 0; i < length - _randomStr.length; i++) {
        _addZeroStr = _addZeroStr + '0';
      }
      return _addZeroStr + _randomStr;
    } else {
      return _randomStr;
    }
  }

  /// 生成流水号，用于requestId和msgId的生成，为了防止黑客篡改数据重复请求（OB审计要求）
  /// 规则：时间戳精确到毫秒，然后再拼接7位随机数，总共24个，注意后台生成的规则是时间戳精确到秒，再拼接10位随机数，总共24位
  static String getSerialNumber() {
    String _timeStr = DateFormat('yyyyMMddHHmmssSSS').format(DateTime.now());
    String _endStr = _getRandomString(7);
    return _timeStr + _endStr;
  }
}

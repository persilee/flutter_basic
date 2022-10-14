/// Copyright (c) 2020 深圳高阳寰球科技有限公司
///
/// Author: zhanggenhua
/// Date: 2020-12-07

// class ConfigKey {
//   static const LANGUAGE = "language";
//   static const DEVICELANGUAGE = "device_language";

//   static const CUST_ID = "cust_id";
//   static const USER_ID = "user_id";
//   static const USER_AREACODE = "user_areaCode";
//   static const USER_PHONE = "user_phone";
//   static const USER_ACCOUNT = "user_account";
//   static const USER_AVATAR_URL = "user_avatar_url";
//   static const USER_SHOW_NAME = "user_show_name";

//   static const NET_TOKEN = "net_token";
//   static const LOGIN_SECRET = "login_secret";

//   static const LOCAL_CCY = "local_ccy";

//   static const USER_BELONGCUSTSTATUS = "user_belongCustStatus"; //用户开户状态
//   static const USER_PASSWORDENABLED = "user_show_passwordEnabled"; //用户交易密码标识
//   static const USER_FIRSTLANDING = "user_firstLanding"; //是否是初始密码

//   static const USER_TYPE = "user_type";
//   // static const USER_PASSWORD = "user_password"; //临时使用，方便开发，后面需要去除保存

//   static const LOCAL_USER_NAME = "local_user_name";
//   static const ENGLISH_USER_NAME = "english_user_name";
//   static const CUST_LOCAL_NAME = "cust_local_name";
//   static const CUST_ENG_NAME = "cust_eng_name";

//   static const NEED_OPEN_ACCOUNT = "need_open_account";

//   static const URL_TYPE = "url_type";

//   static const BIOMETRIC_SWITCH = "biometric_switch"; //生物识别开关
//   static const BIOMETRIC_TEMPCODE = "biometric_tempCode"; //临时登录码
// }

class InputFormartterRegExp {
  /// emjio
  static const String REGEX_EMOJI =
      '[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]';
  static const String REGEX_PWD_LOGIN_INPUT =
      "[a-zA-Z0-9,\\`,\\£¥•‘“,\\~,\\!,\\@,#,\$,\\%,\\^,\\+,\\*,\\&,\\\\,\\/,\\?,\\|,\\:,\\.,\\<,\\>,\\{,\\},\\(,\\),\\'',\\;,\\=,\",\\,,\\-,\\_,\\[,\\],]";

  static const String REGEX_PWD_LOGIN_CHECK =
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\[\]\{\}\#\%\^\*\+\=\_\\\|\~\<\>€£¥•\.\,\?\!‘\-\/\:\;\(\)\$\&\@“]).{8,16}$";

  static const String SIMPLE_PASSWORD =
      r"^[0-9]{4}$##^|1111|2222|3333|4444|5555|6666|7777|8888|9999|0000|(\d{1})\1\1(\d{1})\2\2|(\d{3})\3|(\d{1})\4(\d{1})\5(\d{1})\6|(\d{1})(\d{1})\7\8\7\8|\d{1}\d{1}(\d{1})\9{3}|(\d{1})\10{3}\d{1}\d{1}|(\d{1})\11{4}\d{1}|\d{1}(\d{1})\12{4}$";

  static const String REGEX_EMAIL =
      r"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$";
}

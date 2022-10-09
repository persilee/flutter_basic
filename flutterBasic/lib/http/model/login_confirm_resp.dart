/// token : "fcf7aaaa-3766-42a8-94c3-b1c42a0e3ed1"
/// mobile : "13184529326"
/// nickName : "Collin"
/// attachmentUrl : "ceshi"
/// userNo : "U00202208291443301"
/// customerNo : "C00202208301532081"
/// email : "1742558367@qq.com"

class LoginConfirmResp {
  LoginConfirmResp({
      String? token, 
      String? mobile, 
      String? nickName, 
      String? attachmentUrl, 
      String? userNo, 
      String? customerNo, 
      String? email,}){
    _token = token;
    _mobile = mobile;
    _nickName = nickName;
    _attachmentUrl = attachmentUrl;
    _userNo = userNo;
    _customerNo = customerNo;
    _email = email;
}

  LoginConfirmResp.fromJson(dynamic json) {
    _token = json['token'];
    _mobile = json['mobile'];
    _nickName = json['nickName'];
    _attachmentUrl = json['attachmentUrl'];
    _userNo = json['userNo'];
    _customerNo = json['customerNo'];
    _email = json['email'];
  }
  String? _token;
  String? _mobile;
  String? _nickName;
  String? _attachmentUrl;
  String? _userNo;
  String? _customerNo;
  String? _email;
LoginConfirmResp copyWith({  String? token,
  String? mobile,
  String? nickName,
  String? attachmentUrl,
  String? userNo,
  String? customerNo,
  String? email,
}) => LoginConfirmResp(  token: token ?? _token,
  mobile: mobile ?? _mobile,
  nickName: nickName ?? _nickName,
  attachmentUrl: attachmentUrl ?? _attachmentUrl,
  userNo: userNo ?? _userNo,
  customerNo: customerNo ?? _customerNo,
  email: email ?? _email,
);
  String? get token => _token;
  String? get mobile => _mobile;
  String? get nickName => _nickName;
  String? get attachmentUrl => _attachmentUrl;
  String? get userNo => _userNo;
  String? get customerNo => _customerNo;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['mobile'] = _mobile;
    map['nickName'] = _nickName;
    map['attachmentUrl'] = _attachmentUrl;
    map['userNo'] = _userNo;
    map['customerNo'] = _customerNo;
    map['email'] = _email;
    return map;
  }

}
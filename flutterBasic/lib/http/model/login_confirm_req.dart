/// mobile : ""
/// authCode : ""
/// authId : ""

class LoginConfirmReq {
  LoginConfirmReq({
      String? mobile, 
      String? authCode, 
      String? authId,}){
    _mobile = mobile;
    _authCode = authCode;
    _authId = authId;
}

  LoginConfirmReq.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _authCode = json['authCode'];
    _authId = json['authId'];
  }
  String? _mobile;
  String? _authCode;
  String? _authId;
LoginConfirmReq copyWith({  String? mobile,
  String? authCode,
  String? authId,
}) => LoginConfirmReq(  mobile: mobile ?? _mobile,
  authCode: authCode ?? _authCode,
  authId: authId ?? _authId,
);
  String? get mobile => _mobile;
  String? get authCode => _authCode;
  String? get authId => _authId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['authCode'] = _authCode;
    map['authId'] = _authId;
    return map;
  }

}
/// mobile : "13184529326"
/// gsmCode : "86"

class RegisterApplyReq {
  RegisterApplyReq({
      String? mobile, 
      String? gsmCode,}){
    _mobile = mobile;
    _gsmCode = gsmCode;
}

  RegisterApplyReq.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _gsmCode = json['gsmCode'];
  }
  String? _mobile;
  String? _gsmCode;
RegisterApplyReq copyWith({  String? mobile,
  String? gsmCode,
}) => RegisterApplyReq(  mobile: mobile ?? _mobile,
  gsmCode: gsmCode ?? _gsmCode,
);
  String? get mobile => _mobile;
  String? get gsmCode => _gsmCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['gsmCode'] = _gsmCode;
    return map;
  }

}
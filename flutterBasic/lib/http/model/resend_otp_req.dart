/// authId : "culpa deserunt magn"
/// mobile : "veniam"

class ResendOtpReq {
  ResendOtpReq({
      String? authId, 
      String? mobile,}){
    _authId = authId;
    _mobile = mobile;
}

  ResendOtpReq.fromJson(dynamic json) {
    _authId = json['authId'];
    _mobile = json['mobile'];
  }
  String? _authId;
  String? _mobile;
ResendOtpReq copyWith({  String? authId,
  String? mobile,
}) => ResendOtpReq(  authId: authId ?? _authId,
  mobile: mobile ?? _mobile,
);
  String? get authId => _authId;
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['authId'] = _authId;
    map['mobile'] = _mobile;
    return map;
  }

}
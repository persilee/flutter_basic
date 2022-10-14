/// authId : "2022100909562710001001"
/// effectiveTime : 120

class RegisterApplyResp {
  RegisterApplyResp({
      String? authId, 
      num? effectiveTime,}){
    _authId = authId;
    _effectiveTime = effectiveTime;
}

  RegisterApplyResp.fromJson(dynamic json) {
    _authId = json['authId'];
    _effectiveTime = json['effectiveTime'];
  }
  String? _authId;
  num? _effectiveTime;
RegisterApplyResp copyWith({  String? authId,
  num? effectiveTime,
}) => RegisterApplyResp(  authId: authId ?? _authId,
  effectiveTime: effectiveTime ?? _effectiveTime,
);
  String? get authId => _authId;
  num? get effectiveTime => _effectiveTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['authId'] = _authId;
    map['effectiveTime'] = _effectiveTime;
    return map;
  }

}
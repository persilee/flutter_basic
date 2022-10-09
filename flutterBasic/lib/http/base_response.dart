/// system : "wallet-app-backend"
/// state : 1
/// code : "PARAM_ILLEGAL"
/// message : "请求参数有误"
/// data : {"authId":"2022100911014910001001","effectiveTime":120}
/// detail : [{"field":"data.mobile","value":"null","issue":"mobile NotBlank"}]

class BaseResponse {
  BaseResponse({
    String? system,
    num? state,
    String? code,
    String? message,
    dynamic data,
    List<Detail>? detail,
  }) {
    _system = system;
    _state = state;
    _code = code;
    _message = message;
    _data = data;
    _detail = detail;
  }

  BaseResponse.fromJson(dynamic json) {
    _system = json['system'];
    _state = json['state'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'];
    if (json['detail'] != null) {
      _detail = [];
      json['detail'].forEach((v) {
        _detail?.add(Detail.fromJson(v));
      });
    }
  }
  String? _system;
  num? _state;
  String? _code;
  String? _message;
  dynamic? _data;
  List<Detail>? _detail;
  BaseResponse copyWith({
    String? system,
    num? state,
    String? code,
    String? message,
    dynamic data,
    List<Detail>? detail,
  }) =>
      BaseResponse(
        system: system ?? _system,
        state: state ?? _state,
        code: code ?? _code,
        message: message ?? _message,
        data: data ?? _data,
        detail: detail ?? _detail,
      );
  String? get system => _system;
  num? get state => _state;
  String? get code => _code;
  String? get message => _message;
  dynamic get data => _data;
  List<Detail>? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system'] = _system;
    map['state'] = _state;
    map['code'] = _code;
    map['message'] = _message;
    map['data'] = _data;
    if (_detail != null) {
      map['detail'] = _detail?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// field : "data.mobile"
/// value : "null"
/// issue : "mobile NotBlank"

class Detail {
  Detail({
    String? field,
    String? value,
    String? issue,
  }) {
    _field = field;
    _value = value;
    _issue = issue;
  }

  Detail.fromJson(dynamic json) {
    _field = json['field'];
    _value = json['value'];
    _issue = json['issue'];
  }
  String? _field;
  String? _value;
  String? _issue;
  Detail copyWith({
    String? field,
    String? value,
    String? issue,
  }) =>
      Detail(
        field: field ?? _field,
        value: value ?? _value,
        issue: issue ?? _issue,
      );
  String? get field => _field;
  String? get value => _value;
  String? get issue => _issue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['field'] = _field;
    map['value'] = _value;
    map['issue'] = _issue;
    return map;
  }
}

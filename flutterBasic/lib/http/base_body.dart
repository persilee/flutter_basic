/// data : {"mobile":"13184529326","gsmCode":"86"}
/// appId : "wallet"

class BaseBody {
  dynamic _data;
  String? _appId;

  BaseBody({
    required dynamic data,
    String? appId,
  }) {
    _data = data;
    _appId = appId ?? 'wallet';
  }
  BaseBody.fromJson(dynamic json) {
    _data = json['data'];
    _appId = json['appId'];
  }

  BaseBody copyWith({
    dynamic data,
    String? appId,
  }) =>
      BaseBody(
        data: data ?? _data,
        appId: appId ?? _appId,
      );
  dynamic get data => _data;
  String? get appId => _appId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = _data;
    map['appId'] = _appId;
    return map;
  }
}

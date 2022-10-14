import 'package:json_annotation/json_annotation.dart';

part 'transfer_onePay_account.g.dart';

@JsonSerializable()
class TransOnePayAccountReq extends Object {
  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'gsmCode')
  String? gsmCode;

  TransOnePayAccountReq(
    this.mobile,
    this.gsmCode,
  );

  factory TransOnePayAccountReq.fromJson(Map<String, dynamic> srcJson) =>
      _$TransOnePayAccountReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TransOnePayAccountReqToJson(this);
}

@JsonSerializable()
class TransOnePayAccountResp extends Object {
  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'customerName')
  String? customerName;

  @JsonKey(name: 'attachmentUrl')
  String? attachmentUrl;

  @JsonKey(name: 'userNo')
  String? userNo;

  TransOnePayAccountResp(
    this.mobile,
    this.customerName,
    this.attachmentUrl,
    this.userNo,
  );

  factory TransOnePayAccountResp.fromJson(Map<String, dynamic> srcJson) =>
      _$TransOnePayAccountRespFromJson(srcJson);
  Map<String, dynamic> toJson() => _$TransOnePayAccountRespToJson(this);
}

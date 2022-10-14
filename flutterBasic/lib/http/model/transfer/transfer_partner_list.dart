import 'package:json_annotation/json_annotation.dart';

part 'transfer_partner_list.g.dart';

@JsonSerializable()
class TransferPartnerReq extends Object {
  TransferPartnerReq();

  factory TransferPartnerReq.fromJson(Map<String, dynamic> srcJson) =>
      _$TransferPartnerReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TransferPartnerReqToJson(this);
}

@JsonSerializable()
class TransferPartnerResp extends Object {
  ///转账模板数组
  @JsonKey(name: 'contentData')
  List<PartnerRows>? contentData;

  TransferPartnerResp(this.contentData);

  factory TransferPartnerResp.fromJson(Map<String, dynamic> srcJson) =>
      _$TransferPartnerRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TransferPartnerRespToJson(this);
}

@JsonSerializable()
class PartnerRows extends Object {
  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'customerName')
  String? customerName;

  @JsonKey(name: 'attachmentUrl')
  String? attachmentUrl;

  @JsonKey(name: 'userNo')
  String? userNo;

  PartnerRows(
    this.mobile,
    this.customerName,
    this.attachmentUrl,
    this.userNo,
  );

  factory PartnerRows.fromJson(Map<String, dynamic> srcJson) =>
      _$PartnerRowsFromJson(srcJson);
  Map<String, dynamic> toJson() => _$PartnerRowsToJson(this);
}

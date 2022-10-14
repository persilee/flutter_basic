import 'package:json_annotation/json_annotation.dart';

part 'transfer_commit.g.dart';

@JsonSerializable()
class TransferCommitReq extends Object {
  //支付类型。00 是卡快捷支付，03是钱包支付
  @JsonKey(name: 'payType')
  String? payType;

  ///付款方信息
  @JsonKey(name: 'payer')
  Map<String, dynamic>? payer;

  ///收款方信息
  @JsonKey(name: 'payee')
  Map<String, dynamic>? payee;

  ///金额
  @JsonKey(name: 'amount')
  Map<String, dynamic>? amount;

  ///支付信息
  @JsonKey(name: 'safeInfo')
  Map<String, dynamic>? safeInfo;

  ///前端生成的唯一的订单编号
  @JsonKey(name: 'orderNo')
  String? orderNo;

  ///描述
  @JsonKey(name: 'description')
  String? description;

  TransferCommitReq({
    this.payType,
    this.payer,
    this.payee,
    this.amount,
    this.description,
    this.orderNo,
    this.safeInfo,
  });

  factory TransferCommitReq.fromJson(Map<String, dynamic> srcJson) =>
      _$TransferCommitReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TransferCommitReqToJson(this);
}

@JsonSerializable()
class TransferCommitResp extends Object {
  @JsonKey(name: 'transNo')
  String? transNo;

  @JsonKey(name: 'orderNo')
  String? orderNo;

  @JsonKey(name: 'productNo')
  String? productNo;

  @JsonKey(name: 'orderAmount')
  String? orderAmount;

  @JsonKey(name: 'orderCurrency')
  String? orderCurrency;

  @JsonKey(name: 'exchangeRate')
  String? exchangeRate;

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'currency')
  String? currency;

  @JsonKey(name: 'fee')
  String? fee;

  @JsonKey(name: 'createTime')
  String? createTime;

  @JsonKey(name: 'payTime')
  String? payTime;

  TransferCommitResp(
      this.transNo,
      this.orderNo,
      this.productNo,
      this.orderAmount,
      this.orderCurrency,
      this.exchangeRate,
      this.amount,
      this.currency,
      this.fee,
      this.createTime,
      this.payTime);

  factory TransferCommitResp.fromJson(Map<String, dynamic> srcJson) =>
      _$TransferCommitRespFromJson(srcJson);
  Map<String, dynamic> toJson() => _$TransferCommitRespToJson(this);
}

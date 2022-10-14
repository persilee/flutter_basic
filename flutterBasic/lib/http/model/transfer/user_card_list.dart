import 'package:json_annotation/json_annotation.dart';

part 'user_card_list.g.dart';

@JsonSerializable()
class UserCardAccountListReq extends Object {
  @JsonKey(name: 'bankAccountType')
  int? bankAccountType;

  UserCardAccountListReq({
    this.bankAccountType,
  });

  factory UserCardAccountListReq.fromJson(Map<String, dynamic> srcJson) =>
      _$UserCardAccountListReqFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserCardAccountListReqToJson(this);
}

@JsonSerializable()
class UserCardAccountListResp extends Object {
  @JsonKey(name: 'getUserBindingBankAccountsList')
  List<BankCard>? getUserBindingBankAccountsList;

  @JsonKey(name: 'amount')
  String? amount;

  @JsonKey(name: 'accountNo')
  String? accountNo;

  UserCardAccountListResp(
    this.getUserBindingBankAccountsList,
    this.amount,
    this.accountNo,
  );

  factory UserCardAccountListResp.fromJson(Map<String, dynamic> srcJson) =>
      _$UserCardAccountListRespFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserCardAccountListRespToJson(this);
}

@JsonSerializable()
class BankCard extends Object {
  @JsonKey(name: 'bankAccountNo')
  String? bankAccountNo;

  @JsonKey(name: 'bankAccountType')
  int? bankAccountType;

  @JsonKey(name: 'bankName')
  String? bankName;

  @JsonKey(name: 'bankType')
  String? bankType;

  BankCard(
    this.bankAccountNo,
    this.bankAccountType,
    this.bankName,
    this.bankType,
  );

  factory BankCard.fromJson(Map<String, dynamic> srcJson) =>
      _$BankCardFromJson(srcJson);
  Map<String, dynamic> toJson() => _$BankCardToJson(this);
}

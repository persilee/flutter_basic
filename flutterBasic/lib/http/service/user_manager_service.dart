import 'package:dio/dio.dart';
import 'package:one_pay/http/model/login_apply_req.dart';
import 'package:one_pay/http/model/login_apply_resp.dart';
import 'package:one_pay/http/model/login_confirm_req.dart';
import 'package:one_pay/http/model/login_confirm_resp.dart';
import 'package:one_pay/http/model/resend_otp_req.dart';
import 'package:one_pay/http/model/resend_otp_resp.dart';
import 'package:one_pay/http/model/transfer/transfer_onePay_account.dart';
import 'package:one_pay/http/model/transfer/transfer_partner_list.dart';
import 'package:one_pay/http/model/transfer/user_card_list.dart';
import 'package:retrofit/http.dart';

import '../base_dio.dart';
import '../model/register_apply_req.dart';
import '../model/register_apply_resp.dart';
import '../model/register_confirm_req.dart';
import '../model/register_confirm_resp.dart';
import '../model/transfer/transfer_commit.dart';

part 'user_manager_service.g.dart';

/// 账户总览相关服务接口
@RestApi(baseUrl: BaseDio.BASEURL)
abstract class UserManagerService {
  factory UserManagerService({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _UserManagerService(dio, baseUrl: baseUrl);
  }

  /// 发送OTP
  @POST('/loginApply')
  Future<LoginApplyResp> loginApply(@Body() LoginApplyReq loginApplyReq);

  /// 登录接口
  @POST('/loginConfirm')
  Future<LoginConfirmResp> loginConfirm(
      @Body() LoginConfirmReq loginConfirmResp);

  /// 重新发送OTP
  @POST('/resendOtp')
  Future<ResendOtpResp> resendOtp(@Body() ResendOtpReq resendOtpReq);

  /// 注册申请
  @POST('/registerApply')
  Future<RegisterApplyResp> registerApply(
      @Body() RegisterApplyReq registerApplyReq);

  /// 注册确定
  @POST('/registerConfirm')
  Future<RegisterConfirmResp> registerConfirm(
      @Body() RegisterConfirmReq registerConfirmReq);

  ///获取用户转账伙伴列表
  @POST('/getPayees')
  Future<TransferPartnerResp> getUserPartnerList(
      @Body() TransferPartnerReq transferPartnerReq);

  ///获取用户转账伙伴列表
  @POST('/getCustomerNameByMobile')
  Future<TransOnePayAccountResp> getUserAccountInfo(
      @Body() TransOnePayAccountReq transferAccountInfoReq);

  ///获取用户卡列表
  @POST('/getPaymentMethod')
  Future<UserCardAccountListResp> getUserCardList(
      @Body() UserCardAccountListReq userAccountInfoReq);

  ///转账提交
  @POST('/transfer')
  Future<TransferCommitResp> transferCommitRequest(
      @Body() TransferCommitReq userAccountInfoReq);
}

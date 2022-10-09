import 'package:dio/dio.dart';
import 'package:flutter_basic/http/model/login_apply_req.dart';
import 'package:flutter_basic/http/model/login_apply_resp.dart';
import 'package:flutter_basic/http/model/login_confirm_req.dart';
import 'package:flutter_basic/http/model/login_confirm_resp.dart';
import 'package:retrofit/http.dart';

import '../base_dio.dart';

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
}

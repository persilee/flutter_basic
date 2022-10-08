// Copyright (c) 2021 zhanggenhua. All rights reserved.
//
// Author: zhanggenhua
// Date: 2021-05-10

import 'package:dio/dio.dart';
import 'package:flutter_basic/http/model/get_revenue_by_cards_body.dart';
import 'package:flutter_basic/http/model/get_revenue_by_cards_model.dart';
import 'package:retrofit/http.dart';

import '../base_dio.dart';

part 'account_summary_service.g.dart';

/// 账户总览相关服务接口
@RestApi(baseUrl: BaseDio.BASEURL)
abstract class AccountSummaryService {
  factory AccountSummaryService({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _AccountSummaryService(dio, baseUrl: baseUrl);
  }

  /// 查询账户交易历史
  @POST('/universal/transhis/getRevenueByCards')
  Future<GetRevenueByCardsModel> getRevenueByCards(
      @Body() GetRevenueByCardsBody getRevenueByCardsBody);
}

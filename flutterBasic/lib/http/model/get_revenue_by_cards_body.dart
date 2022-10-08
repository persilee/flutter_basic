/// acNo : "120000061"
/// ccy : ""
/// ciNo : ""
/// ctaNo : ""
/// dateType : ""
/// localDateEnd : "2021-06-08"
/// localDateStart : "2021-05-07"
/// page : 1
/// pageSize : 10
/// sort : ""
/// sortType : ""
/// trnType : ""
/// turnKey : "20210901000000000026000220210602235521"

class GetRevenueByCardsBody {
  String? _acNo;
  String? _ccy;
  String? _ciNo;
  String? _ctaNo;
  String? _dateType;
  String? _localDateEnd;
  String? _localDateStart;
  int? _page;
  int? _pageSize;
  String? _sort;
  String? _sortType;
  String? _trnType;
  String? _turnKey;
  String? _hisTxCode;

  String? get acNo => _acNo;
  String? get ccy => _ccy;
  String? get ciNo => _ciNo;
  String? get ctaNo => _ctaNo;
  String? get dateType => _dateType;
  String? get localDateEnd => _localDateEnd;
  String? get localDateStart => _localDateStart;
  int? get page => _page;
  int? get pageSize => _pageSize;
  String? get sort => _sort;
  String? get sortType => _sortType;
  String? get trnType => _trnType;
  String? get turnKey => _turnKey;
  String? get hisTxCode => _hisTxCode;

  GetRevenueByCardsBody(
      {String? acNo,
      String? ccy,
      String? ciNo,
      String? ctaNo,
      String? dateType,
      String? localDateEnd,
      String? localDateStart,
      int? page,
      int? pageSize,
      String? sort,
      String? sortType,
      String? trnType,
      String? turnKey,
      String? hisTxCode}) {
    _acNo = acNo;
    _ccy = ccy;
    _ciNo = ciNo;
    _ctaNo = ctaNo;
    _dateType = dateType;
    _localDateEnd = localDateEnd;
    _localDateStart = localDateStart;
    _page = page;
    _pageSize = pageSize;
    _sort = sort;
    _sortType = sortType;
    _trnType = trnType;
    _turnKey = turnKey;
    _hisTxCode = hisTxCode;
  }

  GetRevenueByCardsBody.fromJson(dynamic json) {
    _acNo = json["acNo"];
    _ccy = json["ccy"];
    _ciNo = json["ciNo"];
    _ctaNo = json["ctaNo"];
    _dateType = json["dateType"];
    _localDateEnd = json["localDateEnd"];
    _localDateStart = json["localDateStart"];
    _page = json["page"];
    _pageSize = json["pageSize"];
    _sort = json["sort"];
    _sortType = json["sortType"];
    _trnType = json["trnType"];
    _turnKey = json["turnKey"];
    _hisTxCode = json["hisTxCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["acNo"] = _acNo;
    map["ccy"] = _ccy;
    map["ciNo"] = _ciNo;
    map["ctaNo"] = _ctaNo;
    map["dateType"] = _dateType;
    map["localDateEnd"] = _localDateEnd;
    map["localDateStart"] = _localDateStart;
    map["page"] = _page;
    map["pageSize"] = _pageSize;
    map["sort"] = _sort;
    map["sortType"] = _sortType;
    map["trnType"] = _trnType;
    map["turnKey"] = _turnKey;
    map["hisTxCode"] = _hisTxCode;
    return map;
  }
}

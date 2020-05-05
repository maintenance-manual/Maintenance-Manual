import 'package:flutter/material.dart';
import 'package:manual/model/handbookInput_model.dart';
import 'package:manual/model/handbookSearch_model.dart';
/**
 * 手册查询Provide方法
 */

class HandbookSearchModelProvider with ChangeNotifier {
  HandbookSearchModel handbookSearchList;

  //点击获取手册查询列表数据
  getHandbookSearchList(HandbookSearchModel list) {
    handbookSearchList = list;
    notifyListeners();
  }

}

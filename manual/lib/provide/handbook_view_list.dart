import 'package:flutter/material.dart';
import 'package:manual/model/handbookview_model.dart';

class HandbookViewListProvide with ChangeNotifier {
  List<String> handbookList = [];

  //点击大类更换商品列表
  getHandbookList(List<String> list) {
    handbookList = list;
    notifyListeners();
  }

}

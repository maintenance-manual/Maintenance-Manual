import 'package:flutter/material.dart';
import 'package:manual/model/handbookInput_model.dart';

class HandBookInputModelProvide with ChangeNotifier {
  HandBookInputModel handbookInputList;

  //点击获取手册录入列表数据
  getHandbookList(HandBookInputModel list) {
    handbookInputList = list;
    notifyListeners();
  }

  //添加手册文件配置;
  addhandbookInputfilename(String addhandbookInputname) {
    handbookInputList.positionList.add(addhandbookInputname);
    // print('>>>>>>>>'+handbookInputList.positionList.toString());
    notifyListeners();
  }

  //刪除手册文件配置
  deleteHandBookInputname(String deletehandbookinputname) {
    handbookInputList.positionList.remove(deletehandbookinputname);
    notifyListeners();
  }

}

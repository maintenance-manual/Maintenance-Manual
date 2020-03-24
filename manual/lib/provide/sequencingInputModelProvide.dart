import 'package:flutter/material.dart';
import 'package:manual/model/sequencingInputModel.dart';

class SequencingInputModelProvide with ChangeNotifier {
  SequencingInputModel sequencingInputlist;

  //点击获取手册录入列表数据
  getSequencingInputList(SequencingInputModel list) {
    sequencingInputlist = list;
    notifyListeners();
  }

  //添加手册文件配置;
  addSequencingInputfilename(String addsequencingInputname) {
    sequencingInputlist.procedureList.add(addsequencingInputname);
    // print('>>>>>>>>'+handbookInputList.positionList.toString());
    notifyListeners();
  }

  //刪除手册文件配置
  deleteSequencingInputname(String deletesequencinginputname) {
    sequencingInputlist.procedureList.remove(deletesequencinginputname);
    notifyListeners();
  }
}

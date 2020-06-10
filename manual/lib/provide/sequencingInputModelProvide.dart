import 'package:flutter/material.dart';
import 'package:manual/model/sequencingInputModel.dart';

class SequencingInputModelProvide with ChangeNotifier {
  SequencingInputModel sequencingInputlist;

  //点击获取程序录入列表数据
  getSequencingInputList(SequencingInputModel list) {
    sequencingInputlist = list;
    notifyListeners();
  }

  //添加程序录入配置;
  addSequencingInputfilename(String addsequencingInputname) {
    sequencingInputlist.procedureList.add(addsequencingInputname);
    // print('>>>>>>>>'+handbookInputList.positionList.toString());
    notifyListeners();
  }

  //刪除程序录入配置
  deleteSequencingInputname(String deletesequencinginputname) {
    for(int i =0;i<sequencingInputlist.procedureList.length;i++){
      if(sequencingInputlist.procedureList[i].contains(deletesequencinginputname)){
         sequencingInputlist.procedureList.remove(deletesequencinginputname);
      }
    }
    notifyListeners();
  }
}

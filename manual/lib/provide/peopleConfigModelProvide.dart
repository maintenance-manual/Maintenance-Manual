import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';

class PeopleConfigModelProvide with ChangeNotifier {
  PeoleConfigModel peopleConfignameList;
  
  //点击获取岗位配置列表
  getPeopleConfignameList(PeoleConfigModel list) {
    peopleConfignameList = list;
    notifyListeners();
  }

  //添加增加岗位配置;
  addPeopleConfignameList(String addpeopleConfigname) {
    peopleConfignameList.humanList.add(addpeopleConfigname);
    notifyListeners();
  }

  
}

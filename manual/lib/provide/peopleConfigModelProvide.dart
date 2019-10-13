import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';

class PeopleConfigModelProvide with ChangeNotifier {
  PeoleConfigModel peopleConfignameList;
  LookPeopleConfigModel lookpeopleConfignamelist;
  //点击获取人员配置列表
  getPeopleConfignameList(PeoleConfigModel list) {
    peopleConfignameList = list;
    notifyListeners();
  }

  //添加增加人员配置;
  addPeopleConfignameList(String addpeopleConfigname) {
    peopleConfignameList.humanList.add(addpeopleConfigname);
    notifyListeners();
  }

  //添加获取关键字查询人员列表;
  getlookPeopleConfiglist(LookPeopleConfigModel list) {
    lookpeopleConfignamelist = list;
    notifyListeners();
  }
}

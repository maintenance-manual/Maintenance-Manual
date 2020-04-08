import 'package:flutter/material.dart';
import 'package:manual/model/peopleConnectionModel.dart';

class PeopleConnectionModelProvider with ChangeNotifier {
  PeopleConnectionModel peopleConnectionModel;
  //获取人员工作对接数据...
  getpeopleConnectionlist(PeopleConnectionModel list) {
    peopleConnectionModel = list;
    notifyListeners();
  }

  //获取人员工作对接数据;
  addpeopleConnectionnameitem(String addpeopleConnectionname) {
    peopleConnectionModel.workList.add(addpeopleConnectionname);
    notifyListeners();
  }

  //刪除人员工作对接数据
  deletepeopleConnectionname(String deletepeopleConnectionname) {
    peopleConnectionModel.workList.remove(deletepeopleConnectionname);
    notifyListeners();
  }

}

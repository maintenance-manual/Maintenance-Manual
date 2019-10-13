import 'package:flutter/material.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/model/postConfig_model.dart';
import 'package:provide/provide.dart';

class PostConfigModelProvide with ChangeNotifier {
  PostConfigModel postConfigList;
  List<String> tempPostConfiglist1 = [];
  //点击获取岗位配置列表
  getPostConfigList(PostConfigModel list) {
    postConfigList = list;
    notifyListeners();
  }

  //添加增加岗位配置;
  addPostConfignameList(String addpostConfigname) {
    postConfigList.positionList.add(addpostConfigname);
    notifyListeners();
  }
  

  //新增人员配置页面筛选当前目下的的岗位名称;
  selectPostConfignameList(List<String> list, String departmentname) {
    List<String> tempPostConfiglist = [];
    //将所有满足选择部门下的岗位筛选出来
    if (departmentname.contains('无')) {
      tempPostConfiglist1 = [];
    } else {
      for (int i = 0; i < list.length; i++) {
        if (list[i].contains(departmentname)) {
          int end = list[i].indexOf('-');
          tempPostConfiglist.add(list[i].substring(0, end));
        }
        tempPostConfiglist1 = tempPostConfiglist;
      }
    }
    notifyListeners();
  }
}

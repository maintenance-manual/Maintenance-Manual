import 'package:flutter/material.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/model/postConfig_model.dart';

class PostConfigModelProvide with ChangeNotifier {
  PostConfigModel postConfigList;
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
}

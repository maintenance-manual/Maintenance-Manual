import 'package:flutter/material.dart';
import '../model/departmentvView_model.dart';

class UserDepartmentModelProvide with ChangeNotifier {
  DepartmentViewModel departmentnameList;
  DepartmentCreateNew adddepartmentList;
  //点击大类更换商品列表
  getdepartmentname(DepartmentViewModel list) {
    departmentnameList = list;
    notifyListeners();
  }

  adddepartmentname(String adddepartment) {
    //待添加增加部門代碼;
    notifyListeners();
  }
}

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

  //添加增加部門配置;
  adddepartmentname(String adddepartment) {
    departmentnameList.departmentList.add(adddepartment);
    notifyListeners();
  }
  
  //刪除部門配置
  deletedepartmentname(String deletedepartment) {
    departmentnameList.departmentList.remove(deletedepartment);
    notifyListeners();
  }
}

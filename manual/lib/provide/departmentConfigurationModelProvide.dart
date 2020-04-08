import 'package:flutter/material.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import '../model/departmentvView_model.dart';

class DepartmentConfigurationModelProvider with ChangeNotifier {
  DepartmentConfigurationModel departmentConfigurationModel;
  //获取工作名称配置数据...
  getdepartmentConfigurationlist(DepartmentConfigurationModel list) {
    departmentConfigurationModel = list;
    notifyListeners();
  }

  //获取工作名称配置数据;
  adddepartmentConfigurationlist(String adddepartmentConfig) {
    departmentConfigurationModel.workList.add(adddepartmentConfig);
    notifyListeners();
  }

  //刪除共走名称配置数据
  deletedepartmentConfigurationname(String deletedepartmentConfig) {
    departmentConfigurationModel.workList.remove(deletedepartmentConfig);
    notifyListeners();
  }

  //修改工作名称配置数据
  modifyDepartmentConfigurationname(String departmentname,String oldworkname, String olddescription,
      String modifywork, String modifydescription) {
    for (int index = 0;
        index < departmentConfigurationModel.workList.length;
        index++) {
      String needmodifyworkname = departmentConfigurationModel.workList[index]
          .split('--')[1]; //检索工作名称，找到需要配修改的工作名称；
      String needmodifydescription = departmentConfigurationModel
          .workList[index]
          .split('--')[2]; //检索工作描述，找到需要配修改的工作描述；
      //如果修改的数据匹配存放于worklist中的数据时
      if(oldworkname.contains(needmodifyworkname)&&olddescription.contains(needmodifydescription)){
        String replaceoldworklistItem = departmentname+"--"+modifywork+"--"+modifydescription;
        departmentConfigurationModel.workList.remove(departmentConfigurationModel.workList[index]);
        departmentConfigurationModel.workList.add(replaceoldworklistItem);
      }
    }
  }
}

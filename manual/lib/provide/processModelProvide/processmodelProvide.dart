import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/model/processInputModel/addprocess_model.dart.dart';
import 'package:manual/pages/Basic_Configure/post_configure.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:provide/provide.dart';

/**
 * 程序流程修改查看程序状态管理
 */
class ProcessWatchModelProvider with ChangeNotifier {
  ProcessWatchModel processWatchModel;
  DepartmentViewModel departmentlist;
  //获取程序流程查看数据...
  getprocessList(ProcessWatchModel list) {
    processWatchModel = list;
    notifyListeners();
  }

  //添加新增程序步骤;
  addProcess(String addprocess) {
    processWatchModel.stepList.add(addprocess);
    notifyListeners();
  }

  //刪除新增程序步骤数据
  deleteProcess(String deleteprocess) {
    processWatchModel.stepList.remove(deleteprocess);
    notifyListeners();
  }

  //添加修改业务逻辑
  modifyProcess(String modifiedItem, String toModifyItem) {
    if (processWatchModel.stepList.contains(modifiedItem)) {
      processWatchModel.stepList.remove(modifiedItem);
      processWatchModel.stepList.add(toModifyItem);
    }
  }
}

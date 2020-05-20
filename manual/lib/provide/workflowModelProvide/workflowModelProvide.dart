/**
 * 流程工作对接数据
 */
// 搜索查看状态管理
import 'package:flutter/material.dart';
import 'package:manual/model/wrokflowModel/workflowmodel.dart';

class WorkFlowModelProvide with ChangeNotifier {
  WrokFlowModel wrokflowModel;
  //查看搜索后流程
  getwrokflowlist(WrokFlowModel wrokFlowModel) {
    wrokflowModel = wrokFlowModel;
    notifyListeners();
  }

  //添加流程工作;
  addwrokflowlist(String addworkflow) {
    wrokflowModel.workList.add(addworkflow);
    notifyListeners();
  }

  //刪除流程工作
  deletewrokflowlist(String deletewrokflow) {
    wrokflowModel.workList.remove(deletewrokflow);
    notifyListeners();
  }

  //修改流程工作
  modifywrokflow(String needmodifywrokflow, String modifywrokflow) {
    print(needmodifywrokflow);
    for (var i = 0; i < wrokflowModel.workList.length; i++) {
      if (wrokflowModel.workList[i].contains(needmodifywrokflow)) {
        wrokflowModel.workList.remove(wrokflowModel.workList[i]);
        wrokflowModel.workList.add(modifywrokflow);
        notifyListeners();
      }
    }
  }
}

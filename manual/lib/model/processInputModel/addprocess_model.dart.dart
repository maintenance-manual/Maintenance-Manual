/**
 * 程序信息查看模型
 */
class ProcessWatchModel {
  List<String> stepList;

  ProcessWatchModel({this.stepList});

  ProcessWatchModel.fromJson(Map<String, dynamic> json) {
    stepList = json['step_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['step_list'] = this.stepList;
    return data;
  }
}

//程序步骤新增模型
class AddProcessModel {
  String isAddstep;

  AddProcessModel({this.isAddstep});

  AddProcessModel.fromJson(Map<String, dynamic> json) {
    isAddstep = json['isAddstep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddstep'] = this.isAddstep;
    return data;
  }
}

//添加删除程序流程步骤模型
class DeleteProcessModel {
  String creationTime;
  String department;
  String isDeleteStep;
  String revision;
  String step;
  String stepNumber;
  String updateTime;

  DeleteProcessModel(
      {this.creationTime,
      this.department,
      this.isDeleteStep,
      this.revision,
      this.step,
      this.stepNumber,
      this.updateTime});

  DeleteProcessModel.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    department = json['department'];
    isDeleteStep = json['isDeleteStep'];
    revision = json['revision'];
    step = json['step'];
    stepNumber = json['stepNumber'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationTime'] = this.creationTime;
    data['department'] = this.department;
    data['isDeleteStep'] = this.isDeleteStep;
    data['revision'] = this.revision;
    data['step'] = this.step;
    data['stepNumber'] = this.stepNumber;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

class ModifyProcessModel {
  String isModifyStep;

  ModifyProcessModel({this.isModifyStep});

  ModifyProcessModel.fromJson(Map<String, dynamic> json) {
    isModifyStep = json['isModifyStep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isModifyStep'] = this.isModifyStep;
    return data;
  }
}
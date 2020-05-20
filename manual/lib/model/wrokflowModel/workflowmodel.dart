/**
 * 流程工作对接模型
 */
class WrokFlowModel {
  List<String> workList;

  WrokFlowModel({this.workList});

  WrokFlowModel.fromJson(Map<String, dynamic> json) {
    workList = json['workList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workList'] = this.workList;
    return data;
  }
}

//添加流程工作对接模型
class AddWrokFlowModel {
  String isAddProcess;

  AddWrokFlowModel({this.isAddProcess});

  AddWrokFlowModel.fromJson(Map<String, dynamic> json) {
    isAddProcess = json['isAddProcess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddProcess'] = this.isAddProcess;
    return data;
  }
}

//修改流程工作对接模型
class ModifyWrokFlowModel {
  String isModifyProcess;

  ModifyWrokFlowModel({this.isModifyProcess});

  ModifyWrokFlowModel.fromJson(Map<String, dynamic> json) {
    isModifyProcess = json['isModifyProcess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isModifyProcess'] = this.isModifyProcess;
    return data;
  }
}

class DeleteWrokFlowModel {
  String creationTime;
  String department;
  String description;
  String isDeletProcess;
  String process;
  String regulationFile;
  String updateTime;
  String work;

  DeleteWrokFlowModel(
      {this.creationTime,
      this.department,
      this.description,
      this.isDeletProcess,
      this.process,
      this.regulationFile,
      this.updateTime,
      this.work});

  DeleteWrokFlowModel.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    department = json['department'];
    description = json['description'];
    isDeletProcess = json['isDeletProcess'];
    process = json['process'];
    regulationFile = json['regulationFile'];
    updateTime = json['updateTime'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationTime'] = this.creationTime;
    data['department'] = this.department;
    data['description'] = this.description;
    data['isDeletProcess'] = this.isDeletProcess;
    data['process'] = this.process;
    data['regulationFile'] = this.regulationFile;
    data['updateTime'] = this.updateTime;
    data['work'] = this.work;
    return data;
  }
}
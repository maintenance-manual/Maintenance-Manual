//建立工作名称配置数据模型;
class DepartmentConfigurationModel {
  List<String> workList;

  DepartmentConfigurationModel({this.workList});

  DepartmentConfigurationModel.fromJson(Map<String, dynamic> json) {
    workList = json['workList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workList'] = this.workList;
    return data;
  }
}
class AddDepartmentConfigurationModel {
  String isAddWork;

  AddDepartmentConfigurationModel({this.isAddWork});

  AddDepartmentConfigurationModel.fromJson(Map<String, dynamic> json) {
    isAddWork = json['isAddWork'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddWork'] = this.isAddWork;
    return data;
  }
}

class DeletedepartmentConfigurationModel {
  String createTime;
  String depatment;
  String description;
  String isDeleteWork;
  String updateTime;
  String workName;

  DeletedepartmentConfigurationModel(
      {this.createTime,
      this.depatment,
      this.description,
      this.isDeleteWork,
      this.updateTime,
      this.workName});

  DeletedepartmentConfigurationModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    depatment = json['depatment'];
    description = json['description'];
    isDeleteWork = json['isDeleteWork'];
    updateTime = json['updateTime'];
    workName = json['work_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['depatment'] = this.depatment;
    data['description'] = this.description;
    data['isDeleteWork'] = this.isDeleteWork;
    data['updateTime'] = this.updateTime;
    data['work_name'] = this.workName;
    return data;
  }
}

class ModifyDepartmentConfigurationModel {
  String department;
  String description;
  String isModifyWork;
  String work;

  ModifyDepartmentConfigurationModel(
      {this.department, this.description, this.isModifyWork, this.work});

  ModifyDepartmentConfigurationModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    description = json['description'];
    isModifyWork = json['isModifyWork'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['description'] = this.description;
    data['isModifyWork'] = this.isModifyWork;
    data['work'] = this.work;
    return data;
  }
}
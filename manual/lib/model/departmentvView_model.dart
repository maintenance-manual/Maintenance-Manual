//查看部门数据模型
class DepartmentViewModel {
  List<String> departmentList;

  DepartmentViewModel({this.departmentList});

  DepartmentViewModel.fromJson(Map<String, dynamic> json) {
    departmentList = json['departmentList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentList'] = this.departmentList;
    return data;
  }
}

//添加部门数据模型
class DepartmentCreateNew {
  String isAddDepartment;    //是否已经添加，true的话已经添加过;

  DepartmentCreateNew({this.isAddDepartment});

  DepartmentCreateNew.fromJson(Map<String, dynamic> json) {
    isAddDepartment = json['isAddDepartment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddDepartment'] = this.isAddDepartment;
    return data;
  }
  
}

//删除部门模型;
class DeleteDepartmentModel {
  String department;
  String isDeleteDepartment;
  String createTime;
  String updateTime;

  DeleteDepartmentModel(
      {this.department,
      this.isDeleteDepartment,
      this.createTime,
      this.updateTime});

  DeleteDepartmentModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    isDeleteDepartment = json['isDeleteDepartment'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['isDeleteDepartment'] = this.isDeleteDepartment;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    return data;
  }
}
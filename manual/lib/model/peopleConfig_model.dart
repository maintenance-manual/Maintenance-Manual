//查看人员配置模型
class PeoleConfigModel {
  List<String> humanList;

  PeoleConfigModel({this.humanList});

  PeoleConfigModel.fromJson(Map<String, dynamic> json) {
    humanList = json['humanList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['humanList'] = this.humanList;
    return data;
  }
}

//添加人员配置模型;
class AddpeopleConfigModel {
  String isAddHuman;

  AddpeopleConfigModel({this.isAddHuman});

  AddpeopleConfigModel.fromJson(Map<String, dynamic> json) {
    isAddHuman = json['isAddHuman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddHuman'] = this.isAddHuman;
    return data;
  }
}

//关键字查询人员数据模型;
class LookPeopleConfigModel {
  List<String> humanList;

  LookPeopleConfigModel({this.humanList});

  LookPeopleConfigModel.fromJson(Map<String, dynamic> json) {
    humanList = json['humanList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['humanList'] = this.humanList;
    return data;
  }
}

//人员查看数据模型
class PeopleConfigViewModel {
  String createTime;
  String department;
  String email;
  String exists;
  String name;
  String phone;
  String position;
  String sex;
  String updateTime;

  PeopleConfigViewModel(
      {this.createTime,
      this.department,
      this.email,
      this.exists,
      this.name,
      this.phone,
      this.position,
      this.sex,
      this.updateTime});

  PeopleConfigViewModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    department = json['department'];
    email = json['email'];
    exists = json['exists'];
    name = json['name'];
    phone = json['phone'];
    position = json['position'];
    sex = json['sex'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['department'] = this.department;
    data['email'] = this.email;
    data['exists'] = this.exists;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['position'] = this.position;
    data['sex'] = this.sex;
    data['updateTime'] = this.updateTime;
    return data;
  }
}

//添加人员修改模型
class ChangePeopleConfigModel {
  String department;
  String email;
  String isModifyHuman;
  String name;
  String phone;
  String positione;
  String sex;

  ChangePeopleConfigModel(
      {this.department,
      this.email,
      this.isModifyHuman,
      this.name,
      this.phone,
      this.positione,
      this.sex});

  ChangePeopleConfigModel.fromJson(Map<String, dynamic> json) {
    department = json['department'];
    email = json['email'];
    isModifyHuman = json['isModifyHuman'];
    name = json['name'];
    phone = json['phone'];
    positione = json['positione'];
    sex = json['sex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department'] = this.department;
    data['email'] = this.email;
    data['isModifyHuman'] = this.isModifyHuman;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['positione'] = this.positione;
    data['sex'] = this.sex;
    return data;
  }
}

//添加人员删除数据模型
class DeletePeopleConfigModel {
  String sex;
  String position;
  String department;
  String isDeleteHuman;
  String createTime;
  String updateTime;
  String email;
  String phone;
  String name;

  DeletePeopleConfigModel(
      {this.sex,
      this.position,
      this.department,
      this.isDeleteHuman,
      this.createTime,
      this.updateTime,
      this.email,
      this.phone,
      this.name});

  DeletePeopleConfigModel.fromJson(Map<String, dynamic> json) {
    sex = json['sex'];
    position = json['position'];
    department = json['department'];
    isDeleteHuman = json['isDeleteHuman'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    email = json['email'];
    phone = json['phone'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sex'] = this.sex;
    data['position'] = this.position;
    data['department'] = this.department;
    data['isDeleteHuman'] = this.isDeleteHuman;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['name'] = this.name;
    return data;
  }
}

/**
 * 人员工作对接数据模型
 */
class PeopleConnectionModel {
  List<String> workList;

  PeopleConnectionModel({this.workList});

  PeopleConnectionModel.fromJson(Map<String, dynamic> json) {
    workList = json['workList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workList'] = this.workList;
    return data;
  }
}

class AddPeopleConnectionModel {
  String isAddWorker;
  List<String> workList;

  AddPeopleConnectionModel({this.isAddWorker, this.workList});

  AddPeopleConnectionModel.fromJson(Map<String, dynamic> json) {
    isAddWorker = json['isAddWorker'];
    workList = json['workList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddWorker'] = this.isAddWorker;
    data['workList'] = this.workList;
    return data;
  }
}

class DeletePeopleConnectionModel {
  String createTime;
  String isDeleteWorker;
  String username;
  String work;

  DeletePeopleConnectionModel(
      {this.createTime, this.isDeleteWorker, this.username, this.work});

  DeletePeopleConnectionModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    isDeleteWorker = json['isDeleteWorker'];
    username = json['username'];
    work = json['work'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['isDeleteWorker'] = this.isDeleteWorker;
    data['username'] = this.username;
    data['work'] = this.work;
    return data;
  }
}
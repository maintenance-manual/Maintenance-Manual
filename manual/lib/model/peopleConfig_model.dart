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
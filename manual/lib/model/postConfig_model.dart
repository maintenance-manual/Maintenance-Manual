//查看岗位配置模型
class PostConfigModel {
  List<String> positionList =[];
  
  PostConfigModel({this.positionList});

  PostConfigModel.fromJson(Map<String, dynamic> json) {
    positionList = json['positionList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positionList'] = this.positionList;
    return data;
  }
}

//添加岗位配置数据模型
class AddPostConfigModel {
  String isAddPosition;

  AddPostConfigModel({this.isAddPosition});

  AddPostConfigModel.fromJson(Map<String, dynamic> json) {
    isAddPosition = json['isAddPosition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddPosition'] = this.isAddPosition;
    return data;
  }
}
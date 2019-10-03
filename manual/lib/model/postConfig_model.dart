//岗位配置模型
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
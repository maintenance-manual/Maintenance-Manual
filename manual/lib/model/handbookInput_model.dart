class HandBookInputModel {
  List<String> positionList = [];

  HandBookInputModel({this.positionList});

  HandBookInputModel.fromJson(Map<String, dynamic> json) {
    positionList = json['positionList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['positionList'] = this.positionList;
    return data;
  }
}

//删除手册模型
class DeleteHandBookInputModel {
  String manualName;
  String createTime;
  String updateTime;
  String isDeleteManual;

  DeleteHandBookInputModel(
      {this.manualName, this.createTime, this.updateTime, this.isDeleteManual});

  DeleteHandBookInputModel.fromJson(Map<String, dynamic> json) {
    manualName = json['manualName'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    isDeleteManual = json['isDeleteManual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manualName'] = this.manualName;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['isDeleteManual'] = this.isDeleteManual;
    return data;
  }
}

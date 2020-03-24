//程序查询模型
class SequencingInputModel {
  List<String> procedureList;

  SequencingInputModel({this.procedureList});

  SequencingInputModel.fromJson(Map<String, dynamic> json) {
    procedureList = json['procedureList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['procedureList'] = this.procedureList;
    return data;
  }
}
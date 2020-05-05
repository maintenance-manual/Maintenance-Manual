/**
 * 手册查看模型
 */
class HandbookSearchModel {
  List<String> procedureList;

  HandbookSearchModel({this.procedureList});

  HandbookSearchModel.fromJson(Map<String, dynamic> json) {
    procedureList = json['procedureList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['procedureList'] = this.procedureList;
    return data;
  }
}
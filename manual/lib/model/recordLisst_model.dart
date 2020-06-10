class RecordListModel {
  List<String> documentList;

  RecordListModel({this.documentList});

  RecordListModel.fromJson(Map<String, dynamic> json) {
    documentList = json['documentList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentList'] = this.documentList;
    return data;
  }
}
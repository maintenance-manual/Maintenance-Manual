/**
 * 存档查看模型
 */
class FilingWatchModel {
  List<String> reocrdList;

  FilingWatchModel({this.reocrdList});

  FilingWatchModel.fromJson(Map<String, dynamic> json) {
    reocrdList = json['reocrdList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reocrdList'] = this.reocrdList;
    return data;
  }
}
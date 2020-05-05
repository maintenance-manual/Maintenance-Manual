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

class RecordAddModel {
  String isAddRecord;

  RecordAddModel({this.isAddRecord});

  RecordAddModel.fromJson(Map<String, dynamic> json) {
    isAddRecord = json['isAddRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddRecord'] = this.isAddRecord;
    return data;
  }
}

class RecordModifyModel {
  String isModifyRecord;

  RecordModifyModel({this.isModifyRecord});

  RecordModifyModel.fromJson(Map<String, dynamic> json) {
    isModifyRecord = json['isModifyRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isModifyRecord'] = this.isModifyRecord;
    return data;
  }
}

class RecordDeleteModel {
  String creationTime;
  String department;
  String isDeleteRecord;
  String record;
  String recordNumber;
  String revision;
  String updateTime;

  RecordDeleteModel(
      {this.creationTime,
      this.department,
      this.isDeleteRecord,
      this.record,
      this.recordNumber,
      this.revision,
      this.updateTime});

  RecordDeleteModel.fromJson(Map<String, dynamic> json) {
    creationTime = json['creationTime'];
    department = json['department'];
    isDeleteRecord = json['isDeleteRecord'];
    record = json['record'];
    recordNumber = json['recordNumber'];
    revision = json['revision'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creationTime'] = this.creationTime;
    data['department'] = this.department;
    data['isDeleteRecord'] = this.isDeleteRecord;
    data['record'] = this.record;
    data['recordNumber'] = this.recordNumber;
    data['revision'] = this.revision;
    data['updateTime'] = this.updateTime;
    return data;
  }
}


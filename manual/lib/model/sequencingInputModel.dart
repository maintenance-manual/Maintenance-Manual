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

//工作程序添加模型
class AddProcedureModel {
  String isAddProcedure;

  AddProcedureModel({this.isAddProcedure});

  AddProcedureModel.fromJson(Map<String, dynamic> json) {
    isAddProcedure = json['isAddProcedure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAddProcedure'] = this.isAddProcedure;
    return data;
  }
}

//程序录入删除模型
class DeleteSequenceModel {
  String manualName;
  String procedureNumber;
  String procedureName;
  String purpose;
  String applicationRange;
  String terms;
  String proof;
  String revision;
  String createTime;
  String updateTime;
  String isDeleteProcedure;

  DeleteSequenceModel(
      {this.manualName,
      this.procedureNumber,
      this.procedureName,
      this.purpose,
      this.applicationRange,
      this.terms,
      this.proof,
      this.revision,
      this.createTime,
      this.updateTime,
      this.isDeleteProcedure});

  DeleteSequenceModel.fromJson(Map<String, dynamic> json) {
    manualName = json['manualName'];
    procedureNumber = json['procedureNumber'];
    procedureName = json['procedureName'];
    purpose = json['purpose'];
    applicationRange = json['applicationRange'];
    terms = json['terms'];
    proof = json['proof'];
    revision = json['revision'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    isDeleteProcedure = json['isDeleteProcedure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manualName'] = this.manualName;
    data['procedureNumber'] = this.procedureNumber;
    data['procedureName'] = this.procedureName;
    data['purpose'] = this.purpose;
    data['applicationRange'] = this.applicationRange;
    data['terms'] = this.terms;
    data['proof'] = this.proof;
    data['revision'] = this.revision;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['isDeleteProcedure'] = this.isDeleteProcedure;
    return data;
  }
}
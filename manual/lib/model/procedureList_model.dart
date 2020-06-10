class ProcedureListModel {
  List<String> procedureList;

  ProcedureListModel({this.procedureList});

  ProcedureListModel.fromJson(Map<String, dynamic> json) {
    procedureList = json['procedure_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['procedure_list'] = this.procedureList;
    return data;
  }
}


class HandbookViewModel {
  List<String> manualList;

  HandbookViewModel({this.manualList});

  HandbookViewModel.fromJson(Map<String, dynamic> json) {
    manualList = json['manualList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manualList'] = this.manualList;
    return data;
  }
}
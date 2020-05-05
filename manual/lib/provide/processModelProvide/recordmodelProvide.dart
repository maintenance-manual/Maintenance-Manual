import 'package:flutter/material.dart';
import 'package:manual/model/processInputModel/addfiling_model.dart';

class RecordWatchModelProvider with ChangeNotifier {
  FilingWatchModel filingWatchModel;

  getrecordList(FilingWatchModel list){
    filingWatchModel = list;
    notifyListeners();
  }

  addRecord(String addrecord){
    filingWatchModel.reocrdList.add(addrecord);
    notifyListeners();
  }

  deleteRecord(String deleteRecord){
    filingWatchModel.reocrdList.remove(deleteRecord);
    notifyListeners();
  }

  modifyRecord(String modifiedItem, String toModifyItem){
    if (filingWatchModel.reocrdList.contains(modifiedItem)) {
      filingWatchModel.reocrdList.remove(modifiedItem);
      filingWatchModel.reocrdList.add(toModifyItem);
    }
  }
}
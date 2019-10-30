import 'package:flutter/material.dart';
import 'package:manual/model/userconpentence_configModel.dart';

class UserConpentenceConfigModelProvide with ChangeNotifier {
  UserconpentenceModel userConpentencelist;
  UserConpentenceChangeModfel userConpentenceChange;
  ResetpasswordModel resetpasswordlist;
  List<String> tempuserConpentenceConfiglist1 = [];
  //点击获取用户权限配置列表
  getuserConpentenceConfigList(UserconpentenceModel list) {
    userConpentencelist = list;
    notifyListeners();
  }

  //改变用户权限right1;
  changeuserConpentenceright1(bool right1) {
    userConpentenceChange.right1 = right1;
    notifyListeners();
  }
   //改变用户权限right2;
  changeuserConpentenceright2(bool right2) {
    userConpentenceChange.right2 = right2;
    notifyListeners();
  }
   //改变用户权限right3;
  changeuserConpentenceright3(bool right3) {
    userConpentenceChange.right3 = right3;
    notifyListeners();
  }
   //改变用户权限right4;
  changeuserConpentenceright4(bool right4) {
    userConpentenceChange.right4 = right4;
    notifyListeners();
  }

    //重置用户密码;
  resetpassword(String right4) {
    resetpasswordlist.isResetRight = right4;
    notifyListeners();
  }
}

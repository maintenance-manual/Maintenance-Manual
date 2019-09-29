import 'package:flutter/material.dart';
import '../model/userDetailsModel.dart';

class UserDetailsModelProvide with ChangeNotifier {
  UserDetailsModel userList ;

  //点击大类更换商品列表
  getuserDetails(UserDetailsModel  list) {
    userList = list;
    notifyListeners();
  }

}

//增加查询用户权限数据模型;
class UserconpentenceModel {
  List<String> userList;

  UserconpentenceModel({this.userList});

  UserconpentenceModel.fromJson(Map<String, dynamic> json) {
    userList = json['userList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userList'] = this.userList;
    return data;
  }
}

//修改用户权限模型
class UserConpentenceChangeModfel {
  bool isModifyRight;
  bool right1;
  bool right2;
  bool right3;
  bool right4;
  String username;

  UserConpentenceChangeModfel(
      {this.isModifyRight,
      this.right1,
      this.right2,
      this.right3,
      this.right4,
      this.username});

  UserConpentenceChangeModfel.fromJson(Map<String, dynamic> json) {
    isModifyRight = json['isModifyRight'];
    right1 = json['right1'];
    right2 = json['right2'];
    right3 = json['right3'];
    right4 = json['right4'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isModifyRight'] = this.isModifyRight;
    data['right1'] = this.right1;
    data['right2'] = this.right2;
    data['right3'] = this.right3;
    data['right4'] = this.right4;
    data['username'] = this.username;
    return data;
  }
}

//重置密码模型;
class ResetpasswordModel {
  String isResetRight;
  String username;

  ResetpasswordModel({this.isResetRight, this.username});

  ResetpasswordModel.fromJson(Map<String, dynamic> json) {
    isResetRight = json['isResetRight'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isResetRight'] = this.isResetRight;
    data['username'] = this.username;
    return data;
  }
}

//关键字查询人员权限模型;
class KeyWordSearchModel {
  List<String> userList;

  KeyWordSearchModel({this.userList});

  KeyWordSearchModel.fromJson(Map<String, dynamic> json) {
    userList = json['userList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userList'] = this.userList;
    return data;
  }
}

class UserDetailsModel {
  String login;
  String right1;
  String right2;
  String right3;
  String right4;

  UserDetailsModel(
      {this.login, this.right1, this.right2, this.right3, this.right4});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    right1 = json['right1'];
    right2 = json['right2'];
    right3 = json['right3'];
    right4 = json['right4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['right1'] = this.right1;
    data['right2'] = this.right2;
    data['right3'] = this.right3;
    data['right4'] = this.right4;
    return data;
  }
}
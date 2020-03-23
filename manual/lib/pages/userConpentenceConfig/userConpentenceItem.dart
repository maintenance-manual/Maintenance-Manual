import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/userConpentenceConfig/resetpassword.dart';
import 'package:manual/pages/userConpentenceConfig/userConpentencechange.dart';

class CardUserConpentenceItem extends StatelessWidget {
  String useritem;
  CardUserConpentenceItem(context, this.useritem);
  String tempname;
  String tempdepartmentname;
  String temppostname;
  String tempright1;
  String tempright2;
  String tempright3;
  String tempright4;

  @override
  Widget build(BuildContext context) {
    /*数据的具体分析与筛选 */
    if (useritem.contains('--')) {
      //print(useritem);
      List tempitem = useritem.split('--');
      tempname = tempitem[0]; //人员姓名;
      tempdepartmentname = tempitem[1]; //部门名称数据;
      temppostname = tempitem[2]; //岗位名称数据;
      tempright1 = tempitem[3]; //用户权限配置权限;
      tempright2 = tempitem[4]; //手册录入权限;
      tempright3 = tempitem[5]; //基本配置权限;
      tempright4 = tempitem[6]; //部门配置权限;
    }
    if (tempright1.contains("true")) {
      tempright1 = "用户权限";
    } else {
      tempright1 = "无";
    }
    if (tempright2.contains("true")) {
      tempright2 = "手册录入";
    } else {
      tempright2 = "无";
    }
    if (tempright3.contains("true")) {
      tempright3 = "基本配置";
    } else {
      tempright3 = "无";
    }
    if (tempright4.contains("true")) {
      tempright4 = "部门配置";
    } else {
      tempright4 = "无";
    }
    return Container(
      child: _cardList(context, tempname, tempdepartmentname, temppostname,
          tempright1, tempright2, tempright3, tempright4),
    );
  }

//单个标签
//人员名称目录;
  Widget _cardList(context, tempname, tempdepartmentname, temppostname,
      tempright1, tempright2, tempright3, tempright4) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  '所属部门：$tempdepartmentname',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('员工姓名：$tempname'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('岗位名称：$temppostname'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('用户权限配置：$tempright1'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('手册录入权限：$tempright2'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('基本配置权限：$tempright3'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('部门配置权限：$tempright4'),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(250),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UserConpentenceChange(
                                      '$tempdepartmentname',
                                      '$temppostname',
                                      '$tempname',
                                      '$tempright1',
                                      '$tempright2',
                                      '$tempright3',
                                      '$tempright4')));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '修改',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ResetPassword(
                                        '$tempdepartmentname',
                                        '$temppostname',
                                        '$tempname',
                                      )));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(110),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '重置密码',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

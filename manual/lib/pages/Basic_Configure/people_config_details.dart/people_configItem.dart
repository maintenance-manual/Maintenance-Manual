import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_change.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_delete.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_view.dart';

String deleteDepartmentname;
String deletePostConfigname;
String temppeopleConfigname;
List tempHumanItem;

class CardPeopleConfigItem extends StatelessWidget {
  final String peopleConfigname;
  CardPeopleConfigItem(context, this.peopleConfigname);

  String tempPostConfigname = '请点击其他页面刷新';
  String tempdepartmentname = '请点击其他页面刷新';
  @override
  Widget build(BuildContext context) {
    if (peopleConfigname.contains('--')) {
      peopleConfigname.toString().split('--');
      // print('岗位配置传递单个参数分割后结果:');
      // print(peopleConfigname.toString().split('--'));
      tempHumanItem = peopleConfigname.toString().split('--');
      temppeopleConfigname = tempHumanItem[0];
      tempPostConfigname = tempHumanItem[1];
      tempdepartmentname = tempHumanItem[2];
    } else {
      temppeopleConfigname = peopleConfigname;
    }

    return Container(
      child: _mypeopleConfigItem(context, tempdepartmentname,
          temppeopleConfigname, tempPostConfigname),
    );
  }
}

//人员名称目录;
Widget _mypeopleConfigItem(
    context, tempdepartmentname, temppeopleConfigname, tempPostConfigname) {
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
                        child: Text('员工姓名：$temppeopleConfigname'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('岗位名称：$tempPostConfigname'),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: ScreenUtil().setWidth(250),
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PeopleConfigChange(
                                        '$temppeopleConfigname')));
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
                                builder: (context) => PeopleConfigView(
                                    '$temppeopleConfigname')));
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
                              '查看',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PeopleConfigViDelete(
                                    '$temppeopleConfigname')));
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
                              '删除',
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

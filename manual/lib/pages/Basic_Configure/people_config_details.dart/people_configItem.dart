import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_change.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_delete.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_view.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';
import '../department_configure.dart';

String deleteDepartmentname;
String deletePostConfigname;
List tempHumanItem;
// //引入删除部门配置后台数据接口
// Future deletePostConfigName(context, deleteDepartment,delePostConfigname) async {
//   try {
//     Dio dio = Dio();
//     dio.options.contentType =
//         ContentType.parse("application/x-www-form-urlencoded");
//     Response response = await dio.get(
//         "http://47.93.54.102:5000/basicConfigurations/position/delete?itsDepartment=$deleteDepartmentname&deletePosition=$deletePostConfigname",
//         options: Options(
//           responseType: ResponseType.plain,
//         ));
//     return response.data;
//   } catch (e) {
//     print(e);
//   }
// }

// //删除岗位名称
// void deletePostConfigitem(context,itemDepartment,itemPostConfig) {
//   deletePostConfigName(context, itemDepartment,itemPostConfig).then((val) {
//     var data = json.decode(val.toString());
//     DeleteDepartmentModel departmentlist = DeleteDepartmentModel.fromJson(data);
//     Provide.value<UserDepartmentModelProvide>(context)
//         .deletedepartmentname(itemPostConfig);
//     list =
//         Provide.value<UserDepartmentModelProvide>(context).departmentnameList;
//     print('删除......');
//     print(departmentlist.toJson());
//     print(list);
//   });
// }

class CardPeopleConfigItem extends StatelessWidget {
  final String peopleConfigname;
  CardPeopleConfigItem(context, this.peopleConfigname);

  @override
  Widget build(BuildContext context) {
    peopleConfigname.toString().split('--');
    print('岗位配置传递单个参数分割后结果:');
    print(peopleConfigname.toString().split('--'));
    tempHumanItem = peopleConfigname.toString().split('--');
    String temppeopleConfigname = tempHumanItem[0];
    String tempPostConfigname = tempHumanItem[1];
    String tempdepartmentname = tempHumanItem[2];

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
                '所属部门：${tempdepartmentname}',
                style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
              ),
              children: <Widget>[
                ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('员工姓名：${temppeopleConfigname}'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('岗位名称：${tempPostConfigname}'),
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
                                    builder: (context) =>
                                        PeopleConfigChange()));
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
                                builder: (context) => PeopleConfigView()));
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
                                builder: (context) => PeopleConfigViDelete()));
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

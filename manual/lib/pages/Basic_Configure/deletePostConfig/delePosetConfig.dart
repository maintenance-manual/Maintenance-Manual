import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:provide/provide.dart';
import '../department_configure.dart';

String deleteDepartmentname;
String deletePostConfigname;
//引入删除部门配置后台数据接口
// Future deletePostConfigname(context, deleteDepartment,delePostConfigname) async {
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

//删除岗位名称
// void deletePostConfigitem(context,itemDepartment,itemPostConfig) {
//   deletePostConfigname(context, itemDepartment,itemPostConfig).then((val) {
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

class CardPostItem extends StatelessWidget {
  final String departmentname;
  final String postConfigname;
  CardPostItem(context, this.departmentname, this.postConfigname);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _cardPostList(context, departmentname, postConfigname),
    );
  }
}

//部门名称目录;
Widget _cardPostList(context, departmentname, postConfigname) {
  return Container(
    margin: EdgeInsets.only(top: 1.0),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black38))),
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 6.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(320),
            child: Text(
              '${departmentname}',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(280),
            child: Text(
              '${postConfigname}',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          print(postConfigname);
          // deletePostConfigitem(context, departmentname,postConfigname);
        },
        icon: Icon(Icons.delete),
        iconSize: 25.0,
      ),
    ),
  );
}

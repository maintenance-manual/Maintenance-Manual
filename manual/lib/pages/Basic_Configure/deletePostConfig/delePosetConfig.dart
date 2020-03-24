import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/postConfig_model.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';

String deleteDepartmentname;
String deletePostConfigname;
//引入删除部门配置后台数据接口
Future deletePostConfigName(
    context, deleteDepartment, delePostConfigname) async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
     Response response = await Dio().get(
        "http://47.93.54.102:5000/basicConfigurations/position/delete?itsDepartment=$deleteDepartment&deletePosition=$deletePostConfigname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    // Response response = await dio.get(
    //     "http://47.93.54.102:5000/basicConfigurations/position/delete?itsDepartment=$deleteDepartment&deletePosition=$deletePostConfigname",
    //     options: Options(
    //       responseType: ResponseType.plain,
    //     ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//删除岗位名称
void deletePostConfigitem(context, itemDepartment, itemPostConfig) {
  deletePostConfigName(context, itemDepartment, itemPostConfig).then((val) {
    var data = json.decode(val.toString());
    PostConfigModel postConfigmodel = PostConfigModel.fromJson(data);
    Provide.value<PostConfigModelProvide>(context)
        .deletePositonList(itemDepartment);
    print('删除......');
    print(postConfigmodel.toJson());
  });
}

class CardPostItem extends StatelessWidget {
  final String postConfigname;
  CardPostItem(context, this.postConfigname);
  String postConfigname1;
  String departmentname = '请点击其他页面刷新';
  @override
  Widget build(BuildContext context) {
    if (postConfigname.contains('--')) {
      int postConfignameStart = postConfigname.indexOf("--");
      postConfigname1 = postConfigname.substring(0, postConfignameStart);
      departmentname = postConfigname.substring(postConfignameStart + 2);
    } else {
      postConfigname1 = postConfigname;
    }

    return Container(
      child: _cardPostList(context, departmentname, postConfigname1),
    );
  }
}

//部门名称目录;
Widget _cardPostList(context, departmentname, postConfigname1) {
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
              '$departmentname',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(280),
            child: Text(
              '$postConfigname1',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          print('此时传过来的部门名称和岗位名称是:');
          print(departmentname + '     ' + postConfigname1);
          deleteDepartmentname = departmentname;
          deletePostConfigname = postConfigname1;
          deletePostConfigitem(
              context, deleteDepartmentname, deletePostConfigname);
        },
        icon: Icon(Icons.delete),
        iconSize: 25.0,
      ),
    ),
  );
}

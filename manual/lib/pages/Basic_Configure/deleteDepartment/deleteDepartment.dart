import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:provide/provide.dart';
import '../department_configure.dart';

//引入删除部门配置后台数据接口
Future deleteDepartmentname(context, deleteDepartment) async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/basicConfigurations/department/delete?deleteDepartment=$deleteDepartment",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//删除部门名称
void deleteDepartmentitem(context, deleteDepartment) {
  deleteDepartmentname(context, deleteDepartment).then((val) {
    var data = json.decode(val.toString());
    DeleteDepartmentModel departmentlist = DeleteDepartmentModel.fromJson(data);
    Provide.value<UserDepartmentModelProvide>(context)
        .deletedepartmentname(deleteDepartment);
    list =
        Provide.value<UserDepartmentModelProvide>(context).departmentnameList;
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => IndexPage1()));
    print('删除......');
    print(departmentlist.toJson());
    print(list.toJson());
  });
}

class CardItem extends StatelessWidget {
  final String item;
  CardItem(context, this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _cardList(context, item),
    );
  }
}

// 部门名称目录;
Widget _cardList(context, item) {
  return Container(
    margin: EdgeInsets.only(top: 1.0),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.black38))),
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 6.0),
      title: Text(
        '$item',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          print(item);
          deleteDepartment = item;
          deleteDepartmentitem(context, deleteDepartment);
        }, //添加删除逻辑
        icon: Icon(Icons.delete),
        iconSize: 25.0,
      ),
    ),
  );
}

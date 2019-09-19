import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import './department_config_pages/department_config_change.dart'; //引入工作名称配置修改页面;
import './department_config_pages/department_config_view.dart'; //引入工作名称配置查看页面;
import './department_config_pages/department_config_delete.dart'; //引入工作名称配置删除页面;
import './department_config_pages/department_config_createnew.dart'; //引入工作名称配置删除页面;

class DepartmentNameConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('工作名称配置'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(),
              child: Text(
                '工作名称配置',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(35.0)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(50),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 3.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DepartmentName_Configure_CreateNew()));
                },
                child: Text(
                  '新建',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: ScreenUtil().setSp(28.0)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
            ),
            Department_ConfigShow(),
          ],
        ),
      ),
    ));
  }
}

//工作名称配置目录
class Department_ConfigShow extends StatelessWidget {
  List<String> departmentConfigName = [
    '质量检测部门',
    '航空情报部门',
    '空中管制部门',
    '地勤打扫部门',
  ];
  List<String> departmentConfigPeopleName = [
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: departmentConfigName.length,
            itemBuilder: (context, index) {
              return _myDrawer1(context, index);
            },
          ),
        ),
      ],
    );
  }

  //部门名称目录;
  Widget _myDrawer1(context, index) {
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
                  '所属部门：${departmentConfigName[index]}',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('工作名称：${departmentConfigPeopleName[index]}'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('工作描述：${departmentConfigName[index]}'),
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
                                          DepartmentName_Configure_Change()));
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
                                  builder: (context) =>
                                      DepartmentName_Configure_View()));
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
                                  builder: (context) =>
                                      DepartmentName_Configure_Delete()));
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
}

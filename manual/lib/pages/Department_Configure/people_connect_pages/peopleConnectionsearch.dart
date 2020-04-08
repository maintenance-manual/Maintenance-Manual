import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_configItem.dart';
import 'package:manual/pages/Department_Configure/people_connect_pages/people_connect_delete.dart';

class PeopleConnectionSearch extends StatelessWidget {
  final List lookpeopleConfignamelist1;
  const PeopleConnectionSearch(this.lookpeopleConfignamelist1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查询结果'),
      ),
      body: ListView.builder(
        itemCount: lookpeopleConfignamelist1.length,
        itemBuilder: (context, index) {
          List searchlist =
              lookpeopleConfignamelist1[index].toString().split('--');
          return _myDrawer(
              context, searchlist[0], searchlist[1], searchlist[2]);
        },
      ),
    );
  }

//部门名称目录;
  Widget _myDrawer(context, departmentname, worker, workname) {
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
                  '所属部门： $departmentname',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('工作名称： $workname'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('员工姓名： $worker'),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(250),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => People_Connect_Delete(context,departmentname,worker,workname)));
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(70),
                          height: ScreenUtil().setHeight(50),
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

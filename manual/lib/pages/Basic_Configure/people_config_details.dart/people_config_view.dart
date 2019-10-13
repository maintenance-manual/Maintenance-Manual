import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/pages/Basic_Configure/people_configure.dart';
import 'people_config_change.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//引入人员查看数据接口
Future lookPeopleConfig() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/check?name=test0",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('当前人员信息为');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class PeopleConfigView extends StatefulWidget {
  PeopleConfigView({Key key}) : super(key: key);

  _PeopleConfigViewState createState() => _PeopleConfigViewState();
}

class _PeopleConfigViewState extends State<PeopleConfigView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('人员查看'),),
      body: _viewPeopleConfig(context),
    );
  }

  Widget _viewPeopleConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1100),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('员工姓名：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('性别： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('电子邮箱： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('电话： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('所属部门： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('岗位名称： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('创建时间：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('更新时间：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new SizedBox(
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setHeight(100),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleConfigChange()));
                        },
                        child: Text('修改'),
                      ),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(100),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('返回上一页'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class PeopleConfigView extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('人员查看'),
//         ),
//         body: Container(
//           child: _viewPeopleConfig(context),
//         ),
//       ),
//     );
//   }

//   Widget _viewPeopleConfig(context) {
//     return Scaffold(
//       body: Container(
//         width: ScreenUtil().setWidth(740),
//         height: ScreenUtil().setHeight(1100),
//         padding: EdgeInsets.all(10.0),
//         margin: EdgeInsets.only(top: 1.0),
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.all(5.0),
//                 margin: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('员工姓名：',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('性别： ',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('电子邮箱： ',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('电话： ',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('所属部门： ',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('岗位名称： ',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('创建时间：',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 margin: EdgeInsets.all(5.0),
//                 padding: EdgeInsets.all(5.0),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(width: 2.0, color: Colors.black26),
//                   ),
//                 ),
//                 child: Text('更新时间：',
//                     style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
//               ),
//               Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     new SizedBox(
//                       width: ScreenUtil().setWidth(300),
//                       height: ScreenUtil().setHeight(100),
//                       child: RaisedButton(
//                         onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PeopleConfigChange()));
//                         },
//                         child: Text('修改'),
//                       ),
//                     ),
//                     new SizedBox(
//                       width: ScreenUtil().setWidth(350),
//                       height: ScreenUtil().setHeight(100),
//                       child: RaisedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text('返回上一页'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

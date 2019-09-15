import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPostConfig extends StatefulWidget {
  AddPostConfig({Key key}) : super(key: key);

  _AddPostConfigState createState() => _AddPostConfigState();
}

class _AddPostConfigState extends State<AddPostConfig> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('新增岗位配置'),
      ),
      body: Container(
        child: _addPostConfig(context),
      ),
    );
  }

  Widget _addPostConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1334),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请选择所属部门',
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入岗位名称',
                ),
              ),
              new Divider(),
              new SizedBox(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('保存'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class AddPostConfig extends StatelessWidget {
//   const AddPostConfig({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('新增岗位配置'),
//       ),
//       body: Container(
//         child: _addPostConfig(context),
//       ),
//     );
//   }

  // Widget _addPostConfig(context) {
  //   return Scaffold(
  //     body: Container(
  //       width: ScreenUtil().setWidth(740),
  //       height: ScreenUtil().setHeight(1334),
  //       padding: EdgeInsets.all(10.0),
  //       margin: EdgeInsets.only(top: 1.0),
  //       color: Colors.white,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: <Widget>[
  //             new TextFormField(
  //               decoration: new InputDecoration(
  //                 labelText: '请选择所属部门',
  //               ),
  //             ),
  //             new TextFormField(
  //               decoration: new InputDecoration(
  //                 labelText: '请输入岗位名称',
  //               ),
  //             ),
  //             new Divider(),
  //             new SizedBox(
  //               width: ScreenUtil().setWidth(750),
  //               height: ScreenUtil().setHeight(100),
  //               child: RaisedButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('保存'),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

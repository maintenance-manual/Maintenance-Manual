import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSequence extends StatefulWidget {
  @override
  _AddNewSequenceState createState() => _AddNewSequenceState();
}

class _AddNewSequenceState extends State<AddNewSequence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(150),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '新建程序',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            /** continue...*/
          ],
        ),
      ),
    );
  }
}

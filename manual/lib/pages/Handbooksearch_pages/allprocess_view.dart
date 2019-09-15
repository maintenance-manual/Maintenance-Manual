import 'package:flutter/material.dart';
import './singleprocess_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProcessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _numcontainerview(),
            _listcard(context),
          ],
        ),
      ),
    );
  }

  Widget _numcontainerview() {
    return Container(
      alignment: Alignment.centerLeft,
      width: ScreenUtil().setWidth(420),
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.all(3.0),
      margin: EdgeInsets.only(top:3.0,left: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.black54,
      ),
      child: Text('01-01-001 质量手册的管理程序',
          style:
              TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.white)),
    );
  }

  Widget _listcard(context) {
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
                  '步骤编号： ',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('程序流程：'),
                    ),
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SingProcessDetails()));
                    },
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

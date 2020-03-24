//浏览单个手册录入文件组件
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookInput_model.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../handbook_input.dart';
import 'handbookView.dart';

String createtime;
String updatetime;
//引入删除手册文件后台数据接口
Future deleteHandBookInputname(context, deletehandbookinputname) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://47.93.54.102:5000/handbookInput/handbook/delete?manualName=$deletehandbookinputname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

void deletehandbookInputname(context, deletehandbookinputname) {
  deleteHandBookInputname(context, deletehandbookinputname).then((val) {
    Provide.value<HandBookInputModelProvide>(context)
        .deleteHandBookInputname(handbookname);
    list = Provide.value<HandBookInputModelProvide>(context).handbookInputList;
    print('>>>>>>>>>>' + list.positionList.toString());
  });
}

//引入删除手册文件后台数据接口
Future downloadHandBookInputname(downhandbookname) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://47.93.54.102:5000/read/readHandbook/download?manualName=$downhandbookname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

void downloadmessage(context, downhandbookname) {
  downloadHandBookInputname(downhandbookname);
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('下载成功'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '确定',
                style: TextStyle(fontSize: ScreenUtil().setSp(25.0)),
              ),
            ),
          ],
        );
      });
}

class HandBookInputItem extends StatelessWidget {
  final String handbooknamelist;
  final String handbookname;
  HandBookInputItem(context, this.handbooknamelist, this.handbookname) {
    List temphandbookitemlist = handbooknamelist.split('--');
    createtime = temphandbookitemlist[1];
    updatetime = temphandbookitemlist[2];
  }

  @override
  Widget build(BuildContext context) {
    String handbookname_1 = handbookname;
    String createtime_1 = createtime;
    String updatetime_1 = updatetime;
    return Container(
      child: _cardlist(context, handbookname_1, createtime_1, updatetime_1),
    );
  }

  Widget _cardlist(context, handbookname_1, createtime_1, updatetime_1) {
    return ListTile(
      title: Text(
        handbookname,
        style: TextStyle(fontSize: ScreenUtil().setSp(25)),
      ),
      trailing: Container(
        width: ScreenUtil().setWidth(420),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                downloadmessage(context,handbookname_1);
              },
              child: Text(
                '下载',
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
            Text('               '),
            InkWell(
              onTap: () {
                const url =
                    'http://47.93.54.102:5000/handbookInput/handbook/modify';
                launch(url);
              },
              child: Text(
                '编辑',
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
            Text('|'),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HandBookInputViewItem(
                          handbookname_1, createtime_1, updatetime_1)));
                },
                child: Text(
                  '查看',
                  style: TextStyle(color: Colors.blue[500]),
                )),
            Text('|'),
            InkWell(
              onTap: () {
                print('deletehandbookname >>>>>>' + handbookname);
                deletehandbookInputname(context, handbookname);
              },
              child: Text(
                '删除',
                style: TextStyle(color: Colors.blue[500]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

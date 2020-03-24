import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/provide/handbook_view_list.dart';
import 'package:manual/service/service_method.dart';
import 'package:provide/provide.dart';

class HandBookView extends StatefulWidget {
  @override
  _HandBookViewState createState() => _HandBookViewState();
}

class _HandBookViewState extends State<HandBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册浏览'),
      ),
      body: Container(
        child: HandBookList(),
      ),
    );
  }
}

class HandBookList extends StatefulWidget {
  @override
  _HandBookListState createState() => _HandBookListState();
}

class _HandBookListState extends State<HandBookList> {
  List list = [];
  var listIndex = 0;
  List firstCC = [];
  double _value = 0;
  bool _isDownload = false;

  Future getList() async {
    try {
      Dio dio = Dio();
      // dio.options.contentType =
      //     ContentType.parse("application/x-www-form-urlencoded");
      Response response =
          await dio.get("http://47.93.54.102:5000/read/readHandbook",
              options: Options(
                responseType: ResponseType.plain,
              ));
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getList().then((val) {
      var data = json.decode(val.toString());
      HandbookViewModel handbookView = HandbookViewModel.fromJson(data);
      setState(() {
        list = handbookView.manualList;
      });
      for (var item in list) {
        int position = item.toString().indexOf("--");
        String str = item.toString().substring(0, position);
        var i;
        for (i = 0; i < firstCC.length; i++) {
          if (str == firstCC[i]) {
            break;
          }
        }
        if (i == firstCC.length) {
          firstCC.add(str);
        }
      }
      print('获取一级目录数据》》》》》》》》》》');
      print(firstCC);
      print('开始获取手册浏览数据》》》》》》》》》》》');
      Provide.value<HandbookViewListProvide>(context).getHandbookList(list);
      print(list);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: prefix0.ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListView.builder(
        itemCount: firstCC.length,
        itemBuilder: (context, index) {
          return _listInkWell(index);
        },
      ),
    );
  }

  Widget _listInkWell(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: _fccExpansionTile(firstCC[index]),
      ),
    );
  }

  List<Widget> sccExpList;
  Widget _fccExpansionTile(String string) {
    _sccExpTileListState(string);
    return ExpansionTile(
      title: Text(
        string,
        style: TextStyle(fontSize: prefix0.ScreenUtil().setSp(32)),
      ),
      children: sccExpList,
    );
  }

  List sccList;
  List<ListTile> filename;
  _sccExpTileListState(String string) {
    filename = new List();
    sccExpList = new List();
    List secondCategory = [];
    for (var item in list) {
      if (RegExp(r"^" + string + "--").hasMatch(item)) {
        secondCategory
            .add(item.toString().substring(item.toString().indexOf("--") + 2));
      }
    }
    if (string == "维修管理手册" || string.startsWith("CAAC培训大纲")) {
      for (var item in secondCategory) {
        sccExpList.add(
          ListTile(
            title: Text(
              item,
              style: TextStyle(fontSize: prefix0.ScreenUtil().setSp(30)),
            ),
            onTap: () {
              Fluttertoast.showToast(
                msg: "正在下载中...",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
              );
              _download();
            },
          ),
        );
      }
    } else {
      String tmp;
      for (var item in secondCategory) {
        int position = item.toString().indexOf("--");
        String str = item.toString().substring(0, position);
        if (tmp != str) {
          for (var itemString in secondCategory) {
            if (RegExp(r"^" + str + "--").hasMatch(itemString)) {
              filename.add(new ListTile(
                title: Text(
                  itemString.toString().substring(position + 2),
                  style: TextStyle(fontSize: prefix0.ScreenUtil().setSp(28)),
                ),
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "正在下载中...",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                  );
                  _download();
                },
              ));
            }
          }
          sccExpList.add(new ExpansionTile(
            title: Text(
              str,
              style: TextStyle(fontSize: prefix0.ScreenUtil().setSp(28)),
            ),
            backgroundColor: Colors.black12,
            children: filename,
          ));
        }
        tmp = str;
        filename = new List();
      }
    }
  }

  _download() async {
    try {
      await DirectoryUtil.getInstance();
      DirectoryUtil.createStorageDirSync(category: 'pdf');
      String path = DirectoryUtil.getStoragePath(
          fileName: 'handbook1', category: 'pdf', format: 'pdf');
      File file = File(path);

      /// 链接可能会失效
      await Dio().download(
        "http://47.93.54.102:5000/read/readHandbook/download?manualName=维修管理服务工作程序手册（LNJ部分）--第2章%20质量管理--1.pdf",
        file.path,
        onReceiveProgress: (int count, int total) {
          if (total != -1) {
            _value = count / total;
            if (_value == 1) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("提示"),
                        content: Text("下载完成,已存入本地空间"),
                        actions: <Widget>[
                          // 点击按钮关闭对话框
                          FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('确定')),
                        ],
                      ));
            }
          }
        },
      );
    } catch (e) {
      print(e);
      setState(() {
        _isDownload = false;
      });
    }
  }
}

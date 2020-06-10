import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/provide/handbook_view_list.dart';
import 'package:manual/service/service_method.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
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
      width: ScreenUtil().setWidth(750),
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
        style: TextStyle(fontSize: ScreenUtil().setSp(32)),
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
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            ),
            onTap: () async {
              Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("开始下载")));
              String _localPath =
                  (await _findLocalPath(context)) + '/Download/';
              Response responce = await Dio().download(
                  "http://47.93.54.102:5000/read/readHandbook/download?manualName=$string--$item",
                  _localPath + "$string--$item");
              if (responce.statusCode == 200) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("下载成功")));
                OpenFile.open(_localPath + "$string--$item");
              } else {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("下载失败")));
              }
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
                  style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                ),
                onTap: () async {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("开始下载")));
                  String _localPath =
                      (await _findLocalPath(context)) + '/Download/';
                  Response responce = await Dio().download(
                      "http://47.93.54.102:5000/read/readHandbook/download?manualName=$string--$item",
                      _localPath + "$string--$item");
                  if (responce.statusCode == 200) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("下载成功")));
                    OpenFile.open(_localPath + "$string--$item");
                  } else {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("下载失败")));
                  }
                },
              ));
            }
          }
          sccExpList.add(new ExpansionTile(
            title: Text(
              str,
              style: TextStyle(fontSize: ScreenUtil().setSp(28)),
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

  Future<String> _findLocalPath(context) async {
    //这里根据平台获取当前安装目录
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }
}

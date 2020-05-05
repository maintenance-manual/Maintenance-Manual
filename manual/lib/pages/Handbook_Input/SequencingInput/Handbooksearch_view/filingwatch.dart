import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/processInputModel/addfiling_model.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/Handbooksearch_view/addRecord.dart';
import 'package:manual/provide/processModelProvide/recordmodelProvide.dart';
import 'package:provide/provide.dart';

/**
 * 存档信息查看
 */
String handbookname; //手册名称
String procedureNumber; //程序编号

Future _getrecord() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/record?manualName=维修管理手册工作程序&procedureNumber=02-11-002',
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {}
}

Future _deleterecord(recordNumber) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/record/delete?manualName=维修管理手册工作程序&procedureNumber=$procedureNumber&recordNumber=$recordNumber',
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {}
}

class FilingWatch extends StatefulWidget {
  FilingWatch(handbook_name, procedure_Number) {
    handbookname = handbook_name;
    procedureNumber = procedure_Number;
  }
  _FilingWatchState createState() => _FilingWatchState();
}

class _FilingWatchState extends State<FilingWatch> {

  @override
  void initState() { 
    super.initState();
    _getrecord().then((val){
      var data = json.decode(val.toString());
      FilingWatchModel recordWatchModel = FilingWatchModel.fromJson(data);
      Provide.value<RecordWatchModelProvider>(context).getrecordList(recordWatchModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(110),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                '存档信息管理',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AddRecordStep(handbookname, procedureNumber)));
                },
                child: Text(
                  '新建存档',
                  style: TextStyle(
                      color: Colors.blueGrey, fontSize: ScreenUtil().setSp(25)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            _listTitle(),
            RecordWatchExcel()
          ],
        ),
      ),
    ));
  }

  Widget _listTitle() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Text(
        '修订标识 存档编号        存档内容         责任部门   操作',
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(28),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RecordWatchExcel extends StatelessWidget {

  void deleteRecord(context, recordNumber) {
    _deleterecord(recordNumber).then((val) {
      var data = json.decode(val.toString());
      RecordDeleteModel recordWatchModel = RecordDeleteModel.fromJson(data);
      if (recordWatchModel.isDeleteRecord.contains("true")) {
        String recordlistitem = recordWatchModel.revision +
            '--' +
            recordWatchModel.recordNumber +
            '--' +
            recordWatchModel.record +
            '--' +
            recordWatchModel.department;
        Provide.value<RecordWatchModelProvider>(context)
            .deleteRecord(recordlistitem);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除成功'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(990),
      width: ScreenUtil().setWidth(750),
      child: Provide<RecordWatchModelProvider>(
        builder: (context, child, recordWatchModelProvider){
          return ListView.builder(
            itemCount: recordWatchModelProvider.filingWatchModel.reocrdList.length,
            itemBuilder: (BuildContext context, int index) {
            return _listTitleWidget(context, recordWatchModelProvider.filingWatchModel.reocrdList[index]);
           },
          );
        },
      ),
    );
  }

  Widget _listTitleWidget(context, recordList) {
    List<String> listItem = recordList.toString().split('--');
    return Container(
      height: ScreenUtil().setHeight(90),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(90),
            padding: EdgeInsets.only(left: 30.0),
            alignment: Alignment.centerLeft,
            child: Text(listItem[0]),
          ),
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(90),
            padding: EdgeInsets.only(left: 30.0),
            alignment: Alignment.center,
            child: Text(listItem[1]),
          ),
          Container(
            width: ScreenUtil().setWidth(280),
            height: ScreenUtil().setHeight(90),
            padding: EdgeInsets.only(left: 30.0),
            alignment: Alignment.center,
            child: Text(listItem[2]),
          ),
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(90),
            alignment: Alignment.center,
            child: Text(listItem[3]),
          ),
          InkWell(
            onTap: () {
              
            },
            child: Text(
              '修改 ',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          InkWell(
            onTap: () {
              deleteRecord(context, listItem[1]);
            },
            child: Text(
              '删除',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}

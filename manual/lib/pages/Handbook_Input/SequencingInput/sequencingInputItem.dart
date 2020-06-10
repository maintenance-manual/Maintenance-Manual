//浏览单个手册录入文件组件
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookInput_model.dart';
import 'package:manual/model/sequencingInputModel.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/Handbooksearch_view/handbookindex.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:manual/provide/sequencingInputModelProvide.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../handbook_input.dart';
import 'sequencingView.dart';

String createtime;
String updatetime;
List sequencinglist = List(15);
String sequencingMessagelist_1;

//引入删除程序各项值接口---get方法
Future _deleteSequencyingmessage(String procedureNumber) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://47.93.54.102:5000/handbookInput/procedure/delete?procedureNumber=$procedureNumber",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class SequencingInputItem extends StatelessWidget {
  final String sequencingMessagelist;
  String choosedHandbookname; //被选择手册文件的名称;
  String sequenceNumber = '';
  String sequenceName = '';
  String chapter = '第2章%20航线维修';
  String purpose = '无';
  String sphere = '无';
  String terminology = '无';
  String dependency = '无';
  String version = '无';
  SequencingInputItem(context, this.sequencingMessagelist) {
    Pattern pattern = '--';
    List templist = sequencingMessagelist.split(pattern);
    sequencingMessagelist_1 = sequencingMessagelist;
    sequencinglist[0] = templist[0];
    sequencinglist[1] = templist[1];
    sequencinglist[2] = templist[2];
    sequencinglist[3] = templist[3];
    sequencinglist[4] = templist[4];
    sequencinglist[5] = templist[5];
    sequencinglist[6] = templist[6];
    sequencinglist[7] = templist[7];
    sequencinglist[8] = templist[8];
    sequencinglist[9] = templist[9];
    sequencinglist[10] = templist[10];
    sequencinglist[11] = templist[11];
    sequencinglist[12] = templist[12];
    sequencinglist[13] = templist[13];
    sequencinglist[14] = templist[14];
  }

  void deleteSequencyingmessage(context, String deleteProcedureNumber) {
    _deleteSequencyingmessage(deleteProcedureNumber).then((val) {
      var data = jsonDecode(val.toString());
      DeleteSequenceModel deleteSequenceModel =
          DeleteSequenceModel.fromJson(data);
      if (deleteSequenceModel.isDeleteProcedure.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除成功'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    String deleteSequenceName =
                        deleteSequenceModel.procedureNumber +
                            '--' +
                            deleteSequenceModel.procedureName +
                            '--' +
                            chapter +
                            '--' +
                            deleteSequenceModel.manualName +
                            '--' +
                            deleteSequenceModel.purpose +
                            '--' +
                            deleteSequenceModel.applicationRange +
                            '--' +
                            deleteSequenceModel.proof +
                            '--' +
                            deleteSequenceModel.revision +
                            '该文件上未上传'
                                '--' +
                            '该文件上未上传' +
                            '--' +
                            deleteSequenceModel.manualName +
                            '--' +
                            chapter +
                            '--' +
                            deleteSequenceModel.procedureName +
                            '.pdf' +
                            '--' +
                            deleteSequenceModel.createTime +
                            '--' +
                            deleteSequenceModel.updateTime;
                    print('删除的对象是'+deleteSequenceName);
                    Provide.value<SequencingInputModelProvide>(context)
                        .deleteSequencingInputname(deleteSequenceName);
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
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除失败'),
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
      padding: EdgeInsets.all(6.0),
      child: _mysequencingConfigItem(
          context, sequencinglist[3], sequencinglist[1], sequencinglist[2]),
    );
  }

  //程序显示目录
  Widget _mysequencingConfigItem(
      context, tempdepartmentname, temppeopleConfigname, tempPostConfigname) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  '手册名称：$tempdepartmentname',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '程序名称：$temppeopleConfigname',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(300),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '下载',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HandBookSearchView(
                                          tempdepartmentname,
                                          sequencinglist[0])));
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
                                      SequencingView(sequencingMessagelist_1)));
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
                              deleteSequencyingmessage(context,sequencinglist[0]);
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

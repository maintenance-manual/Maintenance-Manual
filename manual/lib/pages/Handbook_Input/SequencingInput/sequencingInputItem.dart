//浏览单个手册录入文件组件
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookInput_model.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/Handbooksearch_view/handbookindex.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../handbook_input.dart';
import 'sequencingView.dart';

String createtime;
String updatetime;
List sequencinglist = List(15);
String sequencingMessagelist_1;

class SequencingInputItem extends StatelessWidget {
  final String sequencingMessagelist;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      child: _mysequencingConfigItem(
          context, sequencinglist[0], sequencinglist[1], sequencinglist[2]),
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

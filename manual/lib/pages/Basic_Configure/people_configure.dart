import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_configItem.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/peoplesearch.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:provide/provide.dart';
import '../Basic_Configure/addPeopleConfig.dart'; //引入人员新建页面;
import 'people_config_details.dart/people_config_change.dart'; //引入人员修改界面;
import 'people_config_details.dart/people_config_delete.dart'; //引入人员删除界面;

PeoleConfigModel humanList1;
String searchText;
//引入人员查看数据接口
Future getPeopleConfig() async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response =
        await dio.get("http://47.93.54.102:5000/basicConfigurations/human",
            options: Options(
              responseType: ResponseType.plain,
            ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入关键字人员查看数据接口
Future lookPeopleConfig() async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/find?keyWord=$searchText",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('获取到的查询结果数据为');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class PeopleConfigure extends StatefulWidget {
  PeopleConfigure({Key key}) : super(key: key);

  _PeopleConfigureState createState() => _PeopleConfigureState();
}

class _PeopleConfigureState extends State<PeopleConfigure> {
  // GlobalKey<RefreshFooterState> _footerkey =
  //     new GlobalKey<RefreshFooterState>();
  @override
  void initState() {
    // TODO: implement initState
    getPeopleConfig().then((val) {
      var data = json.decode(val.toString());
      PeoleConfigModel peopleConfignamelist = PeoleConfigModel.fromJson(data);
      setState(() {
        humanList1 = peopleConfignamelist;
      });
      print('开始获取人员配置数据......');
      print(humanList1.humanList);
      Provide.value<PeopleConfigModelProvide>(context)
          .getPeopleConfignameList(humanList1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('人员配置'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(150),
                    child: SearchPage(),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(980),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          PeopleConfigShow(humanList1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: new Builder(builder: (BuildContext context) {
              //悬浮按钮用来新建;
              return FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddPeopleConfig()));
                },
                mini: false,
                shape: CircleBorder(),
                isExtended: false,
              );
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked));
  }
}

//search
class SearchPage extends StatelessWidget {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  //GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();
  List lookpeopleConfignamelist12 = [];

  void _search(context) {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      lookPeopleConfig().then((val) {
        var data = json.decode(val.toString());
        LookPeopleConfigModel lookpeopleConfignamelist =
            LookPeopleConfigModel.fromJson(data);
        lookpeopleConfignamelist12 =
            lookpeopleConfignamelist.humanList; //没有先走这一步;
        print('----------------------------->>>>');
        print(lookpeopleConfignamelist12);
        print(lookpeopleConfignamelist12.length);
        if (lookpeopleConfignamelist12.length == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    '当前没有您要查询的结果',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                  ),
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
        } else {
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          print(lookpeopleConfignamelist12);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PeopleSearch(lookpeopleConfignamelist12)));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(1081),
      child: Row(
        children: <Widget>[
          Form(
            key: searchKey,
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: ScreenUtil().setWidth(500),
              child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black38, fontSize: 18.0),
                  decoration: InputDecoration(hintText: '关键字模糊查询'),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    searchText = value;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "不允许为空";
                    } else {
                      return null;
                    }
                  }),
            ),
          ),
          FlatButton(
            color: Colors.amber[300],
            highlightColor: Colors.amberAccent[400],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("查询"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              _search(context);
            },
          ),
        ],
      ),
    );
  }
}

//PeopleConfigShow
class PeopleConfigShow extends StatelessWidget {
  PeopleConfigShow(humanList1);
  List list = [];
  List<String> departmentConfigName = [];
  List<String> departmentConfigPeopleName = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: Provide<PeopleConfigModelProvide>(
              builder: (context, child, peopleConfigModelProvide) {
            humanList1 = Provide.value<PeopleConfigModelProvide>(context)
                .peopleConfignameList;
            return Container(
              child: ListView.builder(
                itemCount: humanList1.humanList.length,
                itemBuilder: (context, index) {
                  return CardPeopleConfigItem(
                      context, humanList1.humanList[index]);
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

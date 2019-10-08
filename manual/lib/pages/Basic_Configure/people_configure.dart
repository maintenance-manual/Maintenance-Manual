import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_configItem.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_view.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:provide/provide.dart';
import '../Basic_Configure/addPeopleConfig.dart'; //引入人员新建页面;
import 'people_config_details.dart/people_config_change.dart'; //引入人员修改界面;
import 'people_config_details.dart/people_config_delete.dart'; //引入人员删除界面;

PeoleConfigModel humanList;
//引入人员查看数据接口
Future getPeopleConfig() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
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

class PeopleConfigure extends StatefulWidget {
  PeopleConfigure({Key key}) : super(key: key);

  _PeopleConfigureState createState() => _PeopleConfigureState();
}

class _PeopleConfigureState extends State<PeopleConfigure> {
  @override
  void initState() {
    // TODO: implement initState
    getPeopleConfig().then((val) {
      var data = json.decode(val.toString());
      PeoleConfigModel peopleConfignamelist = PeoleConfigModel.fromJson(data);
      setState(() {
        humanList = peopleConfignamelist;
      });
      print('开始获取人员名稱数据......');
      print(humanList.humanList);
      Provide.value<PeopleConfigModelProvide>(context)
          .getPeopleConfignameList(humanList);
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
                          PeopleConfigShow(),
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
  GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();

  String searchText = '';

  void _search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
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
                    return null;
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
          FlatButton(
            color: Colors.amber[300],
            highlightColor: Colors.amberAccent[400],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("查询"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: (/** continue...*/) {
              _search();
              /** continue...*/
            },
          ),
        ],
      ),
    );
  }
}

//PeopleConfigShow
class PeopleConfigShow extends StatelessWidget {
  List list;
  List<String> departmentConfigName = ["12"];
  List<String> departmentConfigPeopleName = ["!2"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: Provide<PeopleConfigModelProvide>(
              builder: (context, child, peopleConfigModelProvide) {
            list = Provide.value<PeopleConfigModelProvide>(context)
                .peopleConfignameList
                .humanList;
            return Container(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return CardPeopleConfigItem(context, list[index]);
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

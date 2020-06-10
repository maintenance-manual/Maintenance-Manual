import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/allProcedure_model.dart';
import './singleprocess_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Handbooksearch_view/handbookindex.dart';

int count = 0;
List<String> procedure = [];
List<String> revision = [];

Future getAllProcess() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      "http://47.93.54.102:5000/findHandbook/procedureDetails/allProcedure",
      options: Options(responseType: ResponseType.plain),
    );
    return response.data;
  } catch (e) {}
}

class AllProcessView extends StatefulWidget {
  @override
  _AllProcessViewState createState() => _AllProcessViewState();
}

class _AllProcessViewState extends State<AllProcessView> {
  getInfo() {
    getAllProcess().then((value) {
      var data = json.decode(value.toString());
      print(data);
      AllProcedureModel allProcedureModel = AllProcedureModel.fromJson(data);
      count = allProcedureModel.procedureList.length;
      for (var i = 0; i < count; i++) {
        List<String> tmp = allProcedureModel.procedureList[i].split("--");
        procedure.add(tmp[0]);
        revision.add(tmp[1]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    procedure = [];
    revision = [];
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: _listcard(context),
    );
  }

  Widget _listcard(context) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HandBookSearchView(procedure[index].substring(0, 9))));
          },
          title: Text(
            '程序编号： ${procedure[index].substring(0, 9)}',
            style: TextStyle(color: Colors.blueAccent),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('  程序名称： ${procedure[index].substring(9)}'),
              Text('  修订标识： ${revision[index]}'),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
        );
      },
    );
  }
}

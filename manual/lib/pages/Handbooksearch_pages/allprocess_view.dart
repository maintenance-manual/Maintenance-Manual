import 'package:flutter/material.dart';
import './singleprocess_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Handbooksearch_view/handbookindex.dart';

class AllProcessView extends StatelessWidget {
  String procedureNum = "02-11-00";//暂定

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
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HandBookSearchView(procedureNum)));
          },
          title: Text(
            '程序编号： ',
            style: TextStyle(color: Colors.blueAccent),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('  程序名称： '),
              Text('  修订标识： '),
            ],
          ),
          trailing: Icon(Icons.chevron_right),
        );
      },
    );
  }
}

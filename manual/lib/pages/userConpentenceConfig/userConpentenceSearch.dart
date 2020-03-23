import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_configItem.dart';
import 'package:manual/pages/userConpentenceConfig/userConpentenceItem.dart';


class UserConpentenceSearch extends StatelessWidget {
  final List keywordSearchlist;
  const UserConpentenceSearch(this.keywordSearchlist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查询结果'),
      ),
      body: ListView.builder(
        itemCount: keywordSearchlist.length,
        itemBuilder: (context, index) {
          return CardUserConpentenceItem(
              context, keywordSearchlist[index]);
        },
      ),
    );
  }
}

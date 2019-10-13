import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_configItem.dart';

class PeopleSearch extends StatelessWidget {
  final List lookpeopleConfignamelist1;
  const PeopleSearch(this.lookpeopleConfignamelist1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查询结果'),
      ),
      body: ListView.builder(
        itemCount: lookpeopleConfignamelist1.length,
        itemBuilder: (context, index) {
          return CardPeopleConfigItem(
              context, lookpeopleConfignamelist1[index]);
        },
      ),
    );
  }
}

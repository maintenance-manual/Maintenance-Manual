import 'package:flutter/material.dart';
import './sequencingView.dart';
import 'sequencingInputItem.dart';

class SequencyingSearch extends StatelessWidget {
  final List<String> looksequencyinglist;
  const SequencyingSearch(this.looksequencyinglist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查询结果'),
      ),
      body: ListView.builder(
        itemCount: looksequencyinglist.length,
        itemBuilder: (context, index) {
          return SequencingInputItem(
               context,looksequencyinglist[index]);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';

class HandBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('手册浏览'),
      ),
      body: Text('这里是手册浏览界面'),
    ));
  }
}

//手册浏览目录
class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);

  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//定义数组类型;
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  _ExpansionPanelDemoState(){
    mList = new List();
    expandStateList = new List();
    for(int i=0;i<20;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }

  //申明内部方法;
  _setCurrentIndex(int index,isExpand){
    setState(() {
     expandStateList.forEach((item){
       if(item.index==index){
         item.isOpen=!isExpand;
       }
     }); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
         child: ExpansionPanelList(
           expansionCallback: (index,bol){
             _setCurrentIndex(index,bol);
           },
           children: mList.map((index){
              return ExpansionPanel(
                headerBuilder: (context,isExpandded){
                  return ListTile(
                    title: Text('This is No.$index'),
                  );
                },
                body: ListTile(
                  title: Text('expansion no .$index'),
                  onTap: (){},
                ),
                isExpanded: expandStateList[index].isOpen
              );
           }).toList(),
         )
      ),
    );
  }
}

class ExpandStateBean{
  var isOpen;
  var index;
    ExpandStateBean(this.index,this.isOpen);
}
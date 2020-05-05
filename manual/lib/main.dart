import 'package:flutter/material.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:manual/provide/sequencingInputModelProvide.dart';
import 'package:manual/provide/userconpentenceModelProvide.dart';
import 'provide/departmentConfigurationModelProvide.dart';
import 'provide/handbookInputProvide.dart';
import 'provide/handbooksearchProvide.dart';
import 'provide/peopleConnectModelProvide.dart';
import 'provide/processModelProvide/processmodelProvide.dart';
import 'provide/userDetailsModelProvide.dart';
import 'splash_screen.dart';
import 'package:provide/provide.dart';
import 'provide/handbook_view_list.dart';

void main(){
  var providers = Providers();
  var handbookViewListProvide = HandbookViewListProvide();
  var userDepartmentModelProvide = UserDepartmentModelProvide();
  var postConfigModelProvide = PostConfigModelProvide();
  var peopleConfigModelProvide = PeopleConfigModelProvide();
  var userDetailsModelProvide = UserDetailsModelProvide();
  var userConpentenceConfigModelProvide = UserConpentenceConfigModelProvide();
  var handbookInputModelProvide = HandBookInputModelProvide();
  var sequencingInputModelProvide = SequencingInputModelProvide();
  var departmentConfigurationModelProvide = DepartmentConfigurationModelProvider();
  var peopleConnectionModelProvider =PeopleConnectionModelProvider();
  var processWatchModelProvide =ProcessWatchModelProvider();
  var handbookSearchModelProvide = HandbookSearchModelProvider();
  providers
  ..provide(Provider<UserDetailsModelProvide>.value(userDetailsModelProvide))
  ..provide(Provider<UserDepartmentModelProvide>.value(userDepartmentModelProvide))
  ..provide(Provider<PostConfigModelProvide>.value(postConfigModelProvide))
  ..provide(Provider<PeopleConfigModelProvide>.value(peopleConfigModelProvide))
  ..provide(Provider<HandbookViewListProvide>.value(handbookViewListProvide))
  ..provide(Provider<HandBookInputModelProvide>.value(handbookInputModelProvide))
  ..provide(Provider<SequencingInputModelProvide>.value(sequencingInputModelProvide))
  ..provide(Provider<DepartmentConfigurationModelProvider>.value(departmentConfigurationModelProvide))
  ..provide(Provider<PeopleConnectionModelProvider>.value(peopleConnectionModelProvider))
  ..provide(Provider<ProcessWatchModelProvider>.value(processWatchModelProvide))
  ..provide(Provider<HandbookSearchModelProvider>.value(handbookSearchModelProvide))
  ..provide(Provider<UserConpentenceConfigModelProvide>.value(userConpentenceConfigModelProvide));
  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "main",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

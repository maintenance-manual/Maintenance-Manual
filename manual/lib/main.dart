import 'package:flutter/material.dart';
import 'provide/userDetailsModelProvide.dart';
import 'splash_screen.dart';
import 'package:provide/provide.dart';
import 'provide/handbook_view_list.dart';

void main(){
  var providers = Providers();
  var handbookViewListProvide = HandbookViewListProvide();
  var userDetailsModelProvide = UserDetailsModelProvide();

  providers
  ..provide(Provider<UserDetailsModelProvide>.value(userDetailsModelProvide))
  ..provide(Provider<HandbookViewListProvide>.value(handbookViewListProvide));
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

import 'dart:ui';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: _pageRoute(window.defaultRouteName));
  }

  Widget _pageRoute(String routeName) {
    print('name is : $routeName');
    switch (routeName) {
      case 'main/friend':
        return FriendPage(title: 'Flutter Demo Home Page');
      default:
        return FriendPage();

      // case 'friend':
      //   return FriendPage();
    }
  }
}

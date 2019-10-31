import 'package:flutter/material.dart';
import 'package:a_dell/frontend/page_views.dart';
import 'package:a_dell/frontend/list_page.dart';
import 'package:a_dell/frontend/chatbot.dart';
import 'package:a_dell/frontend/funflow.dart';
import 'package:a_dell/backend/login.dart';
import 'package:a_dell/frontend/homepage.dart';
import 'package:a_dell/frontend/pageview/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final List<Widget> _children = [Todo(),ListPage(),Bote(),Flowe()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body:MyHomePage(),
      ),
    );
  }
}

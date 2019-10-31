import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:a_dell/frontend/design/colors.dart';
import 'package:a_dell/frontend/pageview/dashboard.dart';
import 'list_page.dart';
import 'package:a_dell/string.dart';
import 'package:a_dell/questions.dart';

Map<int, GlobalKey<NavigatorState>> navigatorKeys={
  0: GlobalKey<NavigatorState>(),
  1: GlobalKey<NavigatorState>(),
  2: GlobalKey<NavigatorState>(),
};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentIndex;


  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  final List<Widget> _children = [
    Dashboard(),
    Questions(),
  ];

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    void changePage(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    Future<bool> _onBackPressed() {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(false),
              child: Text("No"),
            ),
            new GestureDetector(
              onTap: () => Navigator.of(context).pop(true),
              child: Text(" Yes "),
            ),
          ],
        ),
      ) ??
          false;
    }

    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentIndex].currentState.maybePop(),
      child: Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: <Widget>[
              NavigatorStack(children: _children, currentindex: 0,),
              NavigatorStack(children: _children, currentindex: 1,),
              NavigatorStack(children: _children, currentindex: 2,),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BubbleBottomBar(
            backgroundColor: gradient2,
            hasNotch: true,
            opacity: .2,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: changePage,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                    16)),
            items: [
              BubbleBottomBarItem(
                icon: Icon(Icons.dashboard, color: Colors.white,),
                title: Text('Projects',
                  style: TextStyle(fontFamily: 'Josefin'),),
                backgroundColor: Colors.white,
              ),
              BubbleBottomBarItem(
                  icon: Icon(Icons.pie_chart, color: Colors.white),
                  title: Text('Distribution',
                    style: TextStyle(fontFamily: 'Josefin'),),
                  backgroundColor: Colors.white
              ),
              BubbleBottomBarItem(
                  icon: Icon(Icons.book, color: Colors.white),
                  title: Text('Codebook',
                    style: TextStyle(fontFamily: 'Josefin'),),
                  backgroundColor: Colors.white
              ),
            ],
          )
      ),
    );
  }
}


class NavigatorStack extends StatefulWidget {
  const NavigatorStack({this.currentindex, this.children});
  final int currentindex;
  final List children;
  @override
  _NavigatorStackState createState() => _NavigatorStackState();
}

class _NavigatorStackState extends State<NavigatorStack> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Navigator(
      observers: [HeroController()],
      key: navigatorKeys[widget.currentindex],
        onGenerateRoute: (RouteSettings settings){
          return MaterialPageRoute(settings:settings,
              builder: (BuildContext context){
                return Container(
                  height: _media.height,
                  width: _media.width,
                  color: contentColor,
                  child: widget.children[widget.currentindex],
                );
              }
          );
        }
    );
  }
}

import 'package:a_dell/frontend/funflow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a_dell/frontend/design/colors.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:a_dell/frontend/homepage.dart';
import 'package:a_dell/frontend/pageview/project.dart';
import 'package:a_dell/frontend/addition/addProject.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Map<int, String> projectnames = {
      0: 'Favent',
      1: 'aDell',
      2: 'ZoZo',
    };

    Map<String, int> projectTasks = {
      'Favent': 9,
      'aDell': 4,
      'ZoZo': 0,
    };

    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: _media.height,
        width: _media.width,
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              gradient1,
              gradient2,
            ],
          ),
        ),
        child: Container(
          height: _media.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: _media.height * 0.15,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 55),
                    child: Hero(
                      tag: 'titledash',
                      child: Text(
                        'Projects',
                        style: Theme.of(context)
                            .textTheme
                            .headline
                            .copyWith(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 55),
                  child: Hero(
                    tag: 'subtitledash',
                    child: Text(
                      projectnames.length.toString() + ' Ongoing',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white.withOpacity(0.7), fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 55),
                    child: Hero(
                      tag: '1',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: 300,
                          child: Text(
                            'You have no active projects',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: _media.height * 0.5,
                  constraints: BoxConstraints(minHeight: 420),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return dashCards(
                        name: projectnames[index],
                        tasks: projectTasks[projectnames[index]],
                      );
                    },
                    itemCount: projectnames.length,
                    viewportFraction: 0.7,
                    scale: 0.9,
                    outer: true,
                    itemWidth: _media.width * 0.9,
                    itemHeight: 900,
                    layout: SwiperLayout.TINDER,
                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            size: 5, activeSize: 8, activeColor: gradient1)),
                  ),
                ),
                SizedBox(
                  height: _media.height * 0.04,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'button',
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                                pageBuilder: (BuildContext context, _, __) {
                              return AddProject();
                            }, transitionsBuilder: (_,
                                    Animation<double> animation,
                                    __,
                                    Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            }),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  color: Colors.white.withOpacity(0.9),
                                  size: 20,
                                ),
                                Text(
                                  'Add Project',
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                          color: Colors.white.withOpacity(0.9),
                                          fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _media.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class dashCards extends StatefulWidget {
  dashCards({this.name, this.tasks});

  int tasks;
  String name;

  @override
  _dashCardsState createState() => _dashCardsState();
}

class _dashCardsState extends State<dashCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.grey.shade50,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
                return Project();
              }, transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              }),
            );
          },
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Opacity(
                        opacity: 0.7,
                        child: Icon(
                          Icons.folder_open,
                          color: Colors.purple,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(50),
                          child: Text(
                            'This is a placeholder for project description.',
                            style: TextStyle(
                                color: Colors.grey.shade600.withOpacity(0.7),
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.tasks.toString() + ' Tasks',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 15),
                              ),
                              Text(
                                widget.name,
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Opacity(
                              opacity: 0.6,
                              child: LinearPercentIndicator(
                                lineHeight: 3.0,
                                percent: 0.4,
                                backgroundColor: Colors.grey.shade300,
                                progressColor: Colors.red,
                              ),
                            ),
                          ),
                          Text(
                            '40%',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:a_dell/frontend/design/colors.dart';
import 'package:a_dell/string.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class Tech {
  const Tech(this.name);

  final String name;
}

class Department {
  const Department(this.name);

  final String name;
}


class _QuestionsState extends State<Questions> {
  String newTask;
  Tech tech;
  List<Tech> techNames = <Tech>[const Tech('1'), const Tech('2')];
  Department department;
  List<Department> depNames = <Department>[const Department('1'), const Department('2')];

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: gradient1,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text('', style: TextStyle(color: Colors.white))),
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: _media.height * 0.03,
                  ),
                  Center(
                    child: Container(
                      width: _media.width * 0.83,
                      child: Hero(
                        tag: '3280804',
                        child: TextFormField(
                          onChanged: (text) {
                            setState(() => newTask = text);
                          },
                          cursorColor: gradient2,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Input Question',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                              )),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 36.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _media.width * 0.83,
                    child: Divider(
                      color: Colors.white.withOpacity(0.8),
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: gradient2
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white
                        )
                      ),
                      width: _media.width*0.78,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<Tech>(
                          isExpanded: true,
                          underline: Container(),
                          iconEnabledColor: Colors.white,
                          hint: Align(
                            alignment: Alignment.center,
                              child: Text("Select Tech Used", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),)),
                          value: tech,
                          onChanged: (Tech newValue) {
                            setState(() {
                              tech = newValue;
                            });
                          },
                          items: techNames.map((Tech user) {
                            return DropdownMenuItem<Tech>(
                              value: user,
                              child: Center(
                                child: Text(
                                  user.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor: gradient2
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white)
                      ),
                      width: _media.width*0.78,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton<Department>(
                          isExpanded: true,
                          underline: Container(),
                          iconEnabledColor: Colors.white,
                          hint: Align(
                              alignment: Alignment.center,
                              child: Text("Select Department", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w300),)),
                          value: department,
                          onChanged: (Department newValue) {
                            setState(() {
                              department = newValue;
                            });
                          },
                          items: depNames.map((Department user) {
                            return DropdownMenuItem<Department>(
                              value: user,
                              child: Center(
                                child: Text(
                                  user.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Placeholder 1', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                      Text('Placeholder 2', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                      Text('Placeholder 3', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'button4',
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) {
                                    return String1();
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
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white
                                  )
                              ),
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Get Keywords',
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(
                                          color:
                                          Colors.white.withOpacity(0.9),
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: _media.width*0.9,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                      height: 30,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: 'button2',
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) {
                                    return String1();
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
                                  Text(
                                    'ASK',
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                        color:
                                        Colors.white.withOpacity(0.9),
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
                    height: _media.height * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

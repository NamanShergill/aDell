import 'package:flutter/material.dart';
import 'package:a_dell/frontend/design/colors.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  String newTask;

  void initState(){
    super.initState();
    setState(() {
      newTask = '';
    });
  }

  @override
  Widget build(BuildContext context) {

    final _media= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,title: Text('Add Project', style: TextStyle(color: Colors.black))),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: _media.height*0.03,
                      ),
                      Center(
                        child: Container(
                          width: _media.width*0.83,
                          child: Hero(
                            tag: 'titledash',
                            child: TextFormField(
                              onChanged: (text) {
                                setState(() => newTask = text);
                              },
                              cursorColor: gradient2,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Project Name',
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  )),
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: _media.width*0.83,
                        child: Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: _media.width*0.81,
                          child: Hero(
                            tag: 'subtitledash',
                            child: TextFormField(
                              maxLines: 5,
                              cursorColor: gradient2,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Project Details',
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  )),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
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
                      Align(
                        alignment: Alignment.center,
                        child: Hero(
                          tag: 'button',
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: (){
                                if (newTask.isEmpty) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        'Project Name cannot be empty!', textAlign: TextAlign.center,),
                                    backgroundColor: gradient2,
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  // _scaffoldKey.currentState.showSnackBar(snackBar);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.add, color: gradient2.withOpacity(0.9),size: 20,),
                                      Text(
                                        'Add Project',
                                        style: Theme.of(context).textTheme.title.copyWith(
                                            color: gradient2.withOpacity(0.9), fontSize: 20),
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
                        height: _media.height*0.07,
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

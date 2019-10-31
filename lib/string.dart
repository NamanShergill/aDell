import 'package:flutter/material.dart';
import 'package:a_dell/frontend/design/colors.dart';
import 'package:a_dell/questions.dart';

class String1 extends StatefulWidget {
  @override
  _String1State createState() => _String1State();
}

class _String1State extends State<String1> {

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          elevation: 0,
          title: Text('Are you sure you want to ask the SME?',
            textAlign: TextAlign.center,
            style: TextStyle(),),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            height: 100,
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel', style: TextStyle(
                            color: gradient2
                        ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                        },
                        child: Text('Yes', style: TextStyle(
                            color: gradient2
                        ),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: _media.height*0.07,
              ),
              Container(
                width: _media.width * 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: gradient2,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                        ),
                        height: 60,
                        width: _media.width * 0.9,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Answer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: _media.width * 0.9,
                        height: _media.height * 0.7,
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        'Top level The CEO or the chairman of the board resides at the top of the system with his board of advisors present to advise him on various matters. Currently there are 11 board members apart from the CEO himself. The board is responsible for supervising, managing and assisting all other departments in the company.  Support level 1 Directly under the CEO comes the Vice-Chairman who is also the President of Global Operations and End User Computing Services. He is further supported by 4 other Presidents of Enterprise Solutions, Chief Commercial services, Services and software. All of them act at the same horizontal level and have equal powers over different departments they are heading and are directly answerable to the CEO with his board of directors. There are also 4 other Senior Vice Presidents holding the departments of General Counsel, Marketing, Finance and Human Resources. These members although hold the same level position and privileges as that of presidents but are comparatively more accountable since they deal directly with the people involved in market. Support level 2 Each department is further divided into 25 departments each of which is controlled by the presidents at level 1. None of them can directly contact the top level unless there are some exceptional circumstances; therefore the presidents maintain a complete authority in their function.  These are the managerial levels that handle all the first hand executions of the company.  Three other divisional characteristic All the departments can basically broadly be classified into three other levels;  Technical level which includes all that relates to Pc’s and tabs. They are the pioneers of all research and development programs and are also responsible for introducing innovations to improve sales in the market. The administrative level deals with all internal matters including the core operations of various departments. It is also the media link for the company. And finally the institutional level that acts as a link between the internal departments and external social environment. They deal with customers on a day to day basis and therefore perform functions like marketing, selling, exchange, etc. This is the most managerial level whose functioning in turn determines the objectives for technical departments.',
                                        style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 18),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _media.height*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    child: Hero(
                      tag: 'button2',
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 130,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.arrow_back, color: Colors.white.withOpacity(0.9),size: 20,),
                                  Text(
                                    'Back',
                                    style: Theme.of(context).textTheme.title.copyWith(
                                        color: Colors.white.withOpacity(0.9), fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Hero(
                      tag: 'button3',
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: (){
                            _showDialog(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Still Not Satisfied?',
                                    style: Theme.of(context).textTheme.title.copyWith(
                                        color: Colors.white.withOpacity(0.9), fontSize: 15),
                                  ),
                                  Text(
                                    'Ask SME',
                                    style: Theme.of(context).textTheme.title.copyWith(
                                        color: Colors.white.withOpacity(0.9), fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

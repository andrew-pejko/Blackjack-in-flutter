import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HangMan extends StatefulWidget {
  final int aNumber;
  HangMan({this.aNumber});
  @override
  _HangManState createState() => _HangManState();
}

class _HangManState extends State<HangMan> {
  //amount of cash you have
  int cash;
  int randomNum = 0;
  int a = 0;
  int count = 0;
  String word1 = '';
  bool game = true;
  bool enter = false;
  String one = "___";
  String two = "___";
  String three = "___";
  String four = "___";
  String five = "___";
  String first = "";
  String second = "";
  String third = "";
  String fourth = "";
  String fifth = "";
  String text1 = "";
  String text2 = "";
  String text3 = "";
  String text4 = "";
  String text5 = "";
  String text6 = "";
  String text7 = "";
  String text8 = "";
  String text9 = "";
  String text10 = "";
  String alerttitle = "";
  String alertmessage = "";
  bool invisible1 = true;
  bool invisible2 = true;
  bool invisible3 = true;
  bool invisible4 = true;
  bool invisible5 = true;
  String inputword = ' ';
  String image1 = "images/0.jpg";
  String image2 = "images/1.jpg";
  String image3 = "images/2.jpg";
  String image4 = "images/3.jpg";
  String image5 = "images/4.jpg";
  String image6 = "images/5.jpg";
  String image7 = "images/6.jpg";
  String image8 = "images/7.jpg";
  String image9 = "images/8.jpg";
  String image10 = "images/9.jpg";
  String image11 = "images/10.jpg";

  List<String> l = [];

  void splitAWord(String word) {
    l = word.split('').toList();
  }

  List<String> word = [
    "ABOUT",
    "ABOVE",
    "ABUSE",
    "BEGIN",
    "BEACH",
    "COACH",
    "CHILD",
    "FIELD",
    "MONEY",
    "METAL",
    "MOUSE",
    "MONTH",
    "MUSIC",
    "MOVIE",
    "OCEAN",
    "OWNER",
    "PAGES",
    "PAPER",
    "PEACE",
    "PHONE",
    "PHOTO",
    "PLANE",
    "POWER",
    "RADIO",
    "QUIET",
    "QUEEN",
    "RIVER",
    "SCALE",
    "SHOES",
    "SLEEP",
    "SPORT",
    "STARS",
    "STORY",
    "STORM",
    "TIMES",
    "TOWER",
    "VIDEO",
    "WHOLE",
    "WOMAN",
    "YOUNG",
    "ANGER",
    "ALPHA",
    "NASTY",
    "REALM",
    "PUMPS",
    "RAZOR",
    "SHAKE",
    "SUSHI",
    "TRASH",
    "YACHT",
  ];

  void newgameFunction() {
    setState(() {
      randomNum = Random().nextInt(51);
      word1 = word[randomNum];
      one = "___";
      two = "___";
      three = "___";
      four = "___";
      five = "___";
      image1 = "images/0.jpg";
      count = 0;
      text1 = "";
      text2 = "";
      text3 = "";
      text4 = "";
      text5 = "";
      text6 = "";
      text7 = "";
      text8 = "";
      text9 = "";
      text10 = "";
      inputword = ' ';
    });
  }

// user defined function
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(alerttitle),
          content: new Text(alertmessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void initFunction() {
    enter = true;
    newgameFunction();
    splitAWord(word1);
    print(l);
    first = l[0];
    second = l[1];
    third = l[2];
    fourth = l[3];
    fifth = l[4];
    game = false;
  }

  void guessingFunction() {
    setState(() {
      a = 0;
      if (first.contains(inputword.toUpperCase())) {
        one = first;
        a = 1;
      }
      if (second.contains(inputword.toUpperCase())) {
        two = second;
        a = 1;
      }
      if (third.contains(inputword.toUpperCase())) {
        three = third;
        a = 1;
      }
      if (fourth.contains(inputword.toUpperCase())) {
        four = fourth;
        a = 1;
      }
      if (fifth.contains(inputword.toUpperCase())) {
        five = fifth;
        a = 1;
      }
      if (a == 0) {
        count = count + 1;
      }
      if ((count == 1) && (a == 0)) {
        text1 = inputword;
        image1 = 'images/1.jpg';
      }
      if ((count == 2) && (a == 0)) {
        text2 = inputword;
        image1 = 'images/2.jpg';
      }
      if ((count == 3) && (a == 0)) {
        text3 = inputword;
        image1 = 'images/3.jpg';
      }
      if ((count == 4) && (a == 0)) {
        text4 = inputword;
        image1 = 'images/4.jpg';
      }
      if ((count == 5) && (a == 0)) {
        text5 = inputword;
        image1 = 'images/5.jpg';
      }
      if ((count == 6) && (a == 0)) {
        text6 = inputword;
        image1 = 'images/6.jpg';
      }
      if ((count == 7) && (a == 0)) {
        text7 = inputword;
        image1 = 'images/7.jpg';
      }
      if ((count == 8) && (a == 0)) {
        text8 = inputword;
        image1 = 'images/8.jpg';
      }
      if ((count == 9) && (a == 0)) {
        text9 = inputword;
        image1 = 'images/9.jpg';
      }
      if ((count == 10) && (a == 0)) {
        text10 = inputword;
        image1 = 'images/10.jpg';
        alerttitle = "Game Over";
        alertmessage = "You were not able to guess the correct word";
        _showDialog();
        enter = false;
        game = true;
      }
      if ((one != "___") &&
          (two != "___") &&
          (three != "___") &&
          (four != "___") &&
          (five != "___")) {
        alerttitle = "YOU WIN!";
        alertmessage = "You were able to guess the correct word!";
        cash = cash + 100;
        _showDialog();
        enter = false;
        game = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    cash = widget.aNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    image1,
                    width: 150,
                    height: 225,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Incorrect Guesses:",
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text1,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text2,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text3,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text4,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text5,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text6,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text7,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text8,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text9,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            text10,
                            style: TextStyle(fontSize: 35),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        one,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        two,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        three,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        four,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        five,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Input Letter"),
                      onChanged: (value) {
                        inputword = (value);
                        if (inputword == '') {
                          inputword = ' ';
                        }
                        print(inputword);
                      },
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 75,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: RaisedButton(
                      onPressed: enter ? guessingFunction : null,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text("Enter"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.0, right: 0.0),
                    child: RaisedButton(
                      onPressed: game ? initFunction : null,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text("New Game"),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Cash \$$cash",
                    style: TextStyle(fontSize: 30),
                  ),
                  RaisedButton(
                    child: Text(
                      'Homepage',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () {
                      _sendDataBack(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueGrey)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    int money = cash;
    Navigator.pop(context, money);
  }
}

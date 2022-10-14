import 'package:flutter/material.dart';
import 'secondpage.dart';
import 'HangMan.dart';
//Imports url launcher
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TitlePage(),
    );
  }
}

class TitlePage extends StatefulWidget {
  @override
  _TitlePageState createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  //Amount of starting cash
  int cashAmount = 2000;

//Function for displaying hangman rules
  _launchURL() async {
    const url = 'https://m.wikihow.com/Play-Hangman';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//Function for blackjack rules
  _launchURL2() async {
    const url = 'https://bicyclecards.com/how-to-play/blackjack/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      //Top app bar
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
      ),
      //main body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/app.jpg',
                height: 200,
                width: 400,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Cash \$$cashAmount",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Column for hangman buttons and image
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //HangMan title
                  Text(
                    "Hang Man",
                    style: TextStyle(fontSize: 30),
                  ),
                  //Hangman Image
                  Image.asset(
                    'images/download.png',
                    height: 150,
                    width: 150,
                  ),
                  //Takes you to hang man
                  RaisedButton(
                    child: Text("Make Money"),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueGrey)),
                    onPressed: () {
                      _awaitReturnValueFromHangMan(context);
                    },
                  ),
                  //Takes you to hangman rules
                  RaisedButton(
                      child: Text("Rules"),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey)),
                      onPressed: () {
                        _launchURL();
                      }),
                ],
              ),
            //Column for BlackJack buttons and image
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //BlackJack title
                  Text(
                    "BlackJack",
                    style: TextStyle(fontSize: 30),
                  ),
                  //BlackJack Image
                  Image.asset(
                    'images/abcd.jpg',
                    height: 150,
                    width: 150,
                  ),
                  //Button sends you to blackjack
                  RaisedButton(
                    child: Text("Spend Money"),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blueGrey)),
                    onPressed: () {
                      _awaitReturnValueFromSecondScreen(context);
                    },
                  ),
                  //Button sends you to the BlackJack rules
                  RaisedButton(
                      child: Text("Rules"),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blueGrey)),
                      onPressed: () {
                        _launchURL2();
                      }),
                ],
              )
            ],
          ),
          //extra row for spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[],
          ),
          //extra row for spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[],
          ),
        ],
      ),
    );
  }

//send and recives cash values for blackjack
  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlackJack(aNumber: cashAmount),
        ));

    // after the SecondScreen result comes back update the value widget with it
    setState(() {
      cashAmount = result;
    });
  }

//sends and recives cash values for hang man
  void _awaitReturnValueFromHangMan(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HangMan(aNumber: cashAmount),
        ));

    // after the SecondScreen result comes back update the value widget with it
    setState(() {
      cashAmount = result;
    });
  }
}

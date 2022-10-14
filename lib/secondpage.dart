import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class BlackJack extends StatefulWidget {
  final int aNumber;
  BlackJack({this.aNumber});
  @override
  _BlackJackState createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack> {
  //Pop Up dialog
  String alerttitle = "";
  String alertmessage = "";
  //Variables to remeber bet amount and calculate winnigs
  int bet = 0;
  int bet2 = 0;
  int bet3 = 0;
  //Player starting cash
  int cash;
  //Amount of times a player has hit
  int hitcount = 0;
  //Amount of aces the dealer or player have
  int acecounter = 0;
  int dacecounter = 0;
  //Inmsurance bet and if insurance has been bought
  int insurancecounter = 0;
  int insurancebet = 0;
  //Might remove not sure what it does

// Values for enabling and disabling buttons
  bool restart = false;
  bool betting = true;
  bool game = false;
  bool dd = false;
  bool surender = false;
  bool insurance = false;
// Player values
  int playervalue = 0;
  int dealervalue = 0;
  int dealervalue2 = 0;
//Placeholder for dealers face down card hidden card
  String dcard2v = "";
//Card visibility
  bool pcard3v = false;
  bool pcard4v = false;
  bool pcard5v = false;
  bool dcard3v = false;
  bool dcard4v = false;
  bool dcard5v = false;
// Contains images for all cards and are the values that are replaced depending on assigned card values
  String dcard1 = "images/Red_back.jpg";
  String dcard2 = "images/Red_back.jpg";
  String dcard3 = "images/1C.jpg";
  String dcard4 = "images/2C.jpg";
  String dcard5 = "images/3C.jpg";
  String pcard1 = "images/Red_back.jpg";
  String pcard2 = "images/Red_back.jpg";
  String pcard3 = "images/1C.jpg";
  String pcard4 = "images/2C.jpg";
  String pcard5 = "images/3C.jpg";
//Used to generate random card by choosing a random number fromlist cards whcih pulls out
// a random string and is later assigned to one of the player ot dealer card values
  int randomNum = 0;
  int randomNum2 = 0;
  int randomNum3 = 0;
  int randomNum4 = 0;
// List of cards
  List<String> cards = [
    "images/1C.jpg",
    "images/1D.jpg",
    "images/1H.jpg",
    "images/1S.jpg",
    "images/2C.jpg",
    "images/2D.jpg",
    "images/2H.jpg",
    "images/2S.jpg",
    "images/3C.jpg",
    "images/3D.jpg",
    "images/3H.jpg",
    "images/3S.jpg",
    "images/4C.jpg",
    "images/4D.jpg",
    "images/4H.jpg",
    "images/4S.jpg",
    "images/5C.jpg",
    "images/5D.jpg",
    "images/5H.jpg",
    "images/5S.jpg",
    "images/6C.jpg",
    "images/6D.jpg",
    "images/6H.jpg",
    "images/6S.jpg",
    "images/7C.jpg",
    "images/7D.jpg",
    "images/7H.jpg",
    "images/7S.jpg",
    "images/8C.jpg",
    "images/8D.jpg",
    "images/8H.jpg",
    "images/8S.jpg",
    "images/9C.jpg",
    "images/9D.jpg",
    "images/9H.jpg",
    "images/9S.jpg",
    "images/10C.jpg",
    "images/10D.jpg",
    "images/10H.jpg",
    "images/10S.jpg",
    "images/11C.jpg",
    "images/11D.jpg",
    "images/11H.jpg",
    "images/11S.jpg",
    "images/12C.jpg",
    "images/12D.jpg",
    "images/12H.jpg",
    "images/12S.jpg",
    "images/13C.jpg",
    "images/13D.jpg",
    "images/13H.jpg",
    "images/13S.jpg",
  ];

// inital function. Creates starting carsd for both dealer and player, also enables button and locks in bets
  void betFunction() {
    setState(() {
      if (bet > 0 && bet <= cash) {
        randomNum = Random().nextInt(52) + 1;
        randomNum2 = Random().nextInt(52) + 1;
        randomNum3 = Random().nextInt(52) + 1;
        randomNum4 = Random().nextInt(52) + 1;
        pcard1 = cards[randomNum];
        pcard2 = cards[randomNum2];
        dcard1 = cards[randomNum3];
        dcard2v = cards[randomNum4];
        betting = false;
        game = true;
        dd = true;
        surender = true;
        bet3 = bet;
        cash = cash - bet;
        checkFunction();
        if (randomNum == 11) {
          acecounter = acecounter + 1;
        }
        if (randomNum2 == 11) {
          acecounter = acecounter + 1;
        }
        if (randomNum4 == 11) {
          dacecounter = dacecounter + 1;
        }
        if (randomNum3 == 11) {
          dacecounter = dacecounter + 1;
        }
        playervalue = randomNum + randomNum2;
        dealervalue = randomNum3 + randomNum4;
        if (randomNum3 == 11) {
          insurance = true;
        }
        dealervalue2 = randomNum3;
        Timer(Duration(seconds: 0), () {
          print(dealervalue);
          print(playervalue);
          print(acecounter);
          print(dacecounter);
        });
      }
    });
  }

//Re-sets the game and alows you to place another bet
  void restartfunction() {
    setState(() {
      bet = bet3;
      bet2 = 0;
      bet3 = 0;
      hitcount = 0;
      acecounter = 0;
      dacecounter = 0;
      dealervalue2 = 0;
      insurancecounter = 0;
      insurancebet = 0;
      playervalue = 0;
      dealervalue = 0;
      pcard3v = false;
      pcard4v = false;
      pcard5v = false;
      dcard3v = false;
      dcard4v = false;
      dcard5v = false;
      dd = false;
      surender = false;
      insurance = false;
      pcard1 = "images/Red_back.jpg";
      pcard2 = "images/Red_back.jpg";
      dcard1 = "images/Red_back.jpg";
      dcard2 = "images/Red_back.jpg";
      betting = true;
      game = false;
    });
  }

//slows down the hit
  slowFunction() {
    setState(() {
      if (hitcount == 0) {
        pcard3v = true;
        pcard3 = 'images/Red_back.jpg';
      } else if (hitcount == 1) {
        pcard4v = true;
        pcard4 = 'images/Red_back.jpg';
      } else if (hitcount == 2) {
        pcard5v = true;
        pcard5 = 'images/Red_back.jpg';
      }
      Timer(Duration(seconds: 1), () {
        hitFunction();
      });
    });
  }

// Adds cards to players hand
  void hitFunction() {
    setState(() {
      if (hitcount == 0) {
        randomNum = Random().nextInt(52) + 1;
        pcard3 = cards[randomNum];
        pcard3v = true;
        dd = false;
        surender = false;
        insurance = false;
        hitcount = 1;
        checkFunction();
        playervalue = playervalue + randomNum;
        if (randomNum == 11) {
          acecounter = acecounter + 1;
        }
        playercheckFunction();
      } else if (hitcount == 1) {
        randomNum = Random().nextInt(52) + 1;
        pcard4 = cards[randomNum];
        pcard4v = true;
        hitcount = 2;
        checkFunction();
        playervalue = playervalue + randomNum;
        if (randomNum == 11) {
          acecounter = acecounter + 1;
        }
        playercheckFunction();
      } else if (hitcount == 2) {
        randomNum = Random().nextInt(52) + 1;
        pcard5 = cards[randomNum];
        pcard5v = true;
        hitcount = 3;
        game = false;
        checkFunction();
        playervalue = playervalue + randomNum;
        if (randomNum == 11) {
          acecounter = acecounter + 1;
        }
        playercheckFunction();
      }
      print(playervalue);
    });
  }

//Ends players turn and starts giving the dealer his cards.
  void standFunction() {
    setState(() {
      dealervalue2 = dealervalue;
      game = false;
      dcard2 = dcard2v;
      Timer(Duration(seconds: 1), () {
        dealerFunction1();
      });
      Timer(Duration(milliseconds: 1750), () {
        dealerFunction2();
      });
      Timer(Duration(milliseconds: 2500), () {
        dealerFunction3();
      });
      Timer(Duration(milliseconds: 3500), () {
        winFunction();
      });
      restart = true;
    });
  }

//dealer ai. Causes dealer to stop at 17
  void dealerFunction1() {
    setState(() {
      if (dealervalue > playervalue) {
      } else if (dealervalue < 17) {
        randomNum = Random().nextInt(52) + 1;
        dcard3 = cards[randomNum];
        dcard3v = true;
        checkFunction();
        if (randomNum == 11) {
          dacecounter = dacecounter + 1;
        }
        dealervalue = dealervalue + randomNum;
        dealervalue2 = dealervalue;

        print(dealervalue);
      }
    });
  }

  void dealerFunction2() {
    setState(() {
      if (dealervalue > 21) {
        dealercheckFunction();
      } else if (dealervalue > playervalue) {
      } else if (dealervalue < 17) {
        randomNum = Random().nextInt(52) + 1;
        dcard4 = cards[randomNum];
        dcard4v = true;
        checkFunction();
        dealervalue = dealervalue + randomNum;
        dealervalue2 = dealervalue;
        if (randomNum == 11) {
          dacecounter = dacecounter + 1;
        }
        print(dealervalue);
      }
    });
  }

  void dealerFunction3() {
    setState(() {
      if (dealervalue > 21) {
        dealercheckFunction();
      } else if (dealervalue > playervalue) {
      } else if (dealervalue < 17) {
        randomNum = Random().nextInt(52) + 1;
        dcard5 = cards[randomNum];
        dcard5v = true;
        checkFunction();
        if (randomNum == 11) {
          dacecounter = dacecounter + 1;
        }
        dealervalue = dealervalue + randomNum;
        dealervalue2 = dealervalue;
        if (dealervalue > 21) {
          dealercheckFunction();
        }
        print(dealervalue);
      }
    });
  }

//Function to see if player is past 21
  void playercheckFunction() {
    setState(() {
      if (dealervalue > 21) {
        dealercheckFunction();
      } else if ((playervalue > 21) & (acecounter > 0)) {
        acecounter = acecounter - 1;
        playervalue = playervalue - 10;
      } else if (playervalue > 21) {
        alerttitle = "You lost";
        alertmessage = "You went over 21 and lost \$$bet ";
        _showDialog();
        bet2 = bet;
      } else if (hitcount == 3) {
        standFunction();
      }
    });
  }

  void dealercheckFunction() {
    if ((dealervalue > 21) & (dacecounter > 0)) {
      dacecounter = dacecounter - 1;
      dealervalue = dealervalue - 10;
    }
  }

//win game function will show who won game
  void winFunction() {
    if (dealervalue == 21 && insurancecounter == 1) {
      alerttitle = "Winner";
      insurancebet = bet * 2;
      alertmessage =
          "You won your insurance bet and have been refunded \$$insurancebet";
      cash = cash + insurancebet;
      restart = true;
      _showDialog();
    } else if (dealervalue > 21) {
      alerttitle = "Winner";
      bet2 = bet;
      bet = bet * 2;
      alertmessage = "You won \$$bet " +
          "You had a $playervalue and the dealer had a $dealervalue";
      bet = bet + bet2;
      cash = cash + bet;
      restart = true;
      _showDialog();
    } else if (dealervalue < playervalue) {
      alerttitle = "Winner";
      bet2 = bet;
      bet = bet * 2;
      alertmessage = "You won \$$bet " +
          "You had a $playervalue and the dealer had a $dealervalue";
      bet = bet + bet2;
      cash = cash + bet;
      restart = true;
      _showDialog();
    } else if (dealervalue > playervalue) {
      alerttitle = "You lost";
      alertmessage = "You lost \$$bet " +
          "You had a $playervalue and the dealer had a $dealervalue";
      restart = true;
      _showDialog();
      bet2 = bet;
    } else if (dealervalue == playervalue) {
      alerttitle = "Tie";
      alertmessage = "You have tied with the dealer. " +
          "You had a $playervalue and the dealer had a $dealervalue";
      cash = cash + bet;
      restart = true;
      _showDialog();
      bet2 = bet;
    }
  }

//Insurance
  void insuranceFunction() {
    setState(() {
      insurance = false;
      insurancecounter = 1;
      insurancebet = bet;
      cash = cash - insurancebet;
    });
  }

//Surender
  void surenderFunction() {
    bet = bet ~/ 2;
    bet.round();
    cash = cash + bet;
    restartfunction();
  }

//Double Down
  void ddFunction() {
    setState(() {
      cash = cash - bet;
      bet = bet * 2;
      randomNum = Random().nextInt(52) + 1;
      pcard3 = cards[randomNum];
      pcard3v = true;
      checkFunction();
      if (randomNum == 11) {
        acecounter = acecounter + 1;
      }
      playervalue = playervalue + randomNum;
      if (playervalue > 21 && acecounter > 0) {
        acecounter = acecounter - 1;
        playervalue = playervalue - 10;
      }
      if (playervalue > 21) {
        alerttitle = "You lost";
        alertmessage = "You went over 21 and lost \$$bet ";
        _showDialog();
      } else {
        game = false;
        dcard2 = dcard2v;
        dealerFunction1();
        dealerFunction2();
        dealerFunction3();
        winFunction();
      }
    });
  }

//pop up dialog
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
                restartfunction();
                restart = false;
              },
            ),
          ],
        );
      },
    );
  }

//converts randomNum variable from useless 1-52 value to a 1-11 value so it can be added players total card count
  void checkFunction() {
    if (cards[randomNum].contains("11")) {
      randomNum = 10;
    } else if (cards[randomNum].contains("12")) {
      randomNum = 10;
    } else if (cards[randomNum].contains("13")) {
      randomNum = 10;
    } else if (cards[randomNum].contains("4")) {
      randomNum = 4;
    } else if (cards[randomNum].contains("5")) {
      randomNum = 5;
    } else if (cards[randomNum].contains("6")) {
      randomNum = 6;
    } else if (cards[randomNum].contains("7")) {
      randomNum = 7;
    } else if (cards[randomNum].contains("8")) {
      randomNum = 8;
    } else if (cards[randomNum].contains("9")) {
      randomNum = 9;
    } else if (cards[randomNum].contains("10")) {
      randomNum = 10;
    } else if (cards[randomNum].contains("1")) {
      randomNum = 11;
    } else if (cards[randomNum].contains("2")) {
      randomNum = 2;
    } else if (cards[randomNum].contains("3")) {
      randomNum = 3;
    }
    if (cards[randomNum2].contains("11")) {
      randomNum2 = 10;
    } else if (cards[randomNum2].contains("12")) {
      randomNum2 = 10;
    } else if (cards[randomNum2].contains("13")) {
      randomNum2 = 10;
    } else if (cards[randomNum2].contains("4")) {
      randomNum2 = 4;
    } else if (cards[randomNum2].contains("5")) {
      randomNum2 = 5;
    } else if (cards[randomNum2].contains("6")) {
      randomNum2 = 6;
    } else if (cards[randomNum2].contains("7")) {
      randomNum2 = 7;
    } else if (cards[randomNum2].contains("8")) {
      randomNum2 = 8;
    } else if (cards[randomNum2].contains("9")) {
      randomNum2 = 9;
    } else if (cards[randomNum2].contains("10")) {
      randomNum2 = 10;
    } else if (cards[randomNum2].contains("1")) {
      randomNum2 = 11;
    } else if (cards[randomNum2].contains("2")) {
      randomNum2 = 2;
    } else if (cards[randomNum2].contains("3")) {
      randomNum2 = 3;
    }
    if (cards[randomNum3].contains("11")) {
      randomNum3 = 10;
    } else if (cards[randomNum3].contains("12")) {
      randomNum3 = 10;
    } else if (cards[randomNum3].contains("13")) {
      randomNum3 = 10;
    } else if (cards[randomNum3].contains("4")) {
      randomNum3 = 4;
    } else if (cards[randomNum3].contains("5")) {
      randomNum3 = 5;
    } else if (cards[randomNum3].contains("6")) {
      randomNum3 = 6;
    } else if (cards[randomNum3].contains("7")) {
      randomNum3 = 7;
    } else if (cards[randomNum3].contains("8")) {
      randomNum3 = 8;
    } else if (cards[randomNum3].contains("9")) {
      randomNum3 = 9;
    } else if (cards[randomNum3].contains("10")) {
      randomNum3 = 10;
    } else if (cards[randomNum3].contains("1")) {
      randomNum3 = 11;
    } else if (cards[randomNum3].contains("2")) {
      randomNum3 = 2;
    } else if (cards[randomNum3].contains("3")) {
      randomNum3 = 3;
    }
    if (cards[randomNum4].contains("11")) {
      randomNum4 = 10;
    } else if (cards[randomNum4].contains("12")) {
      randomNum4 = 10;
    } else if (cards[randomNum4].contains("13")) {
      randomNum4 = 10;
    } else if (cards[randomNum4].contains("4")) {
      randomNum4 = 4;
    } else if (cards[randomNum4].contains("5")) {
      randomNum4 = 5;
    } else if (cards[randomNum4].contains("6")) {
      randomNum4 = 6;
    } else if (cards[randomNum4].contains("7")) {
      randomNum4 = 7;
    } else if (cards[randomNum4].contains("8")) {
      randomNum4 = 8;
    } else if (cards[randomNum4].contains("9")) {
      randomNum4 = 9;
    } else if (cards[randomNum4].contains("10")) {
      randomNum4 = 10;
    } else if (cards[randomNum4].contains("1")) {
      randomNum4 = 11;
    } else if (cards[randomNum4].contains("2")) {
      randomNum4 = 2;
    } else if (cards[randomNum4].contains("3")) {
      randomNum4 = 3;
    }
  }

  @override
  void initState() {
    super.initState();
    cash = widget.aNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Row for basic information still have to add payout rates and dealer rules
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
                Text(
                  "Cash \$$cash",
                  style: TextStyle(fontSize: 32),
                ),
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              /*RaisedButton(
                child: Text(
                  'Restart',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: restart ? restartfunction : null,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blueGrey)),
              ),*/
            ],
          ),
          // Dealer side. Have to add dealer mechanincs and mabye change card positioning.
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // This container houses all 5 possible daler cards. Uses stack to
                // overlay one card ontop of the other for spacing purposes
                Container(
                  height: 200,
                  width: 214,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          right: 50,
                          child: Image.asset(
                            dcard1,
                            height: 175,
                            width: 175,
                          )),
                      Positioned(
                          left: 10,
                          child: Image.asset(
                            dcard2,
                            height: 175,
                            width: 175,
                          )),
                      Visibility(
                        visible: dcard3v,
                        child: Positioned(
                            left: 30,
                            child: Image.asset(
                              dcard3,
                              height: 175,
                              width: 175,
                            )),
                      ),
                      Visibility(
                        visible: dcard4v,
                        child: Positioned(
                            left: 50,
                            child: Image.asset(
                              dcard4,
                              height: 175,
                              width: 175,
                            )),
                      ),
                      Visibility(
                        visible: dcard5v,
                        child: Positioned(
                            left: 70,
                            child: Image.asset(
                              dcard5,
                              height: 175,
                              width: 175,
                            )),
                      ),
                    ],
                  ),
                ),

                Text(
                  "Total:$dealervalue2".toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ]),
          //this row contains the betting mechanic. Allows player to bet up to there xurrent amount of cash.
          //has a text input and button to not clutter space
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 100,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Bet Amount'),
                    onChanged: (value) {
                      bet = int.parse(value);
                      if (bet > cash) {
                        bet = 0;
                      }
                    },
                  ),
                ),
                RaisedButton(
                  child: Text("Bet"),
                  onPressed: betting ? betFunction : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blueGrey)),
                ),
                SizedBox(
                  width: 100,
                ),
              ]),
          //this is the player side. Contains container that houses cards similar to dealer side
          //also has stand and hit functions but stand is yet to be finished
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Stand"),
                  onPressed: game ? standFunction : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blueGrey)),
                ),
                //This container has all image assets and spacing rules
                Container(
                  height: 160,
                  width: 175,
                  child: Stack(overflow: Overflow.clip, children: <Widget>[
                    Positioned(
                        child: Image.asset(
                      pcard1,
                      height: 120,
                      width: 120,
                    )),
                    Positioned(
                        left: 12,
                        top: 10,
                        child: Image.asset(
                          pcard2,
                          height: 120,
                          width: 120,
                        )),
                    Visibility(
                      visible: pcard3v,
                      child: Positioned(
                          left: 24,
                          top: 20,
                          child: Image.asset(
                            pcard3,
                            height: 120,
                            width: 120,
                          )),
                    ),
                    Visibility(
                      visible: pcard4v,
                      child: Positioned(
                          left: 36,
                          top: 30,
                          child: Image.asset(
                            pcard4,
                            height: 120,
                            width: 120,
                          )),
                    ),
                    Visibility(
                      visible: pcard5v,
                      child: Positioned(
                          left: 48,
                          top: 40,
                          child: Image.asset(
                            pcard5,
                            height: 120,
                            width: 120,
                          )),
                    ),
                  ]),
                ),
                RaisedButton(
                  child: Text("Hit"),
                  onPressed: game ? slowFunction : null,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.blueGrey)),
                ),
              ]),
          //Final row contains Insurance, Surrendor, and Double Down, Both surrendor adn Doubel down are
          //simple to do, but insurance purplexes me and will require more reaserch
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Insurance"),
                        onPressed: insurance ? insuranceFunction : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueGrey)),
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Total: $playervalue",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      RaisedButton(
                        child: Text("Double Down"),
                        onPressed: dd ? ddFunction : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueGrey)),
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Surrender"),
                        onPressed: surender ? surenderFunction : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blueGrey)),
                      ),
                    ]),
              ]),
        ],
      ),
    );
  }

  void _sendDataBack(BuildContext context) {
    int money = cash;
    Navigator.pop(context, money);
  }
}

import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage HomeImage1,HomeImage2;
  var answer = "Try out your Luck";

  @override
  void initState(){
    super.initState();
    setState(() {
      HomeImage1 = one;
      HomeImage2 = one;
    });
  }

  void diceChanger(){
    int random = (1+Random().nextInt(6));
    int anotherRandom = (1+Random().nextInt(6));
    AssetImage firstImage;
    AssetImage secondImage;
    switch (random) {
      case 1:
        firstImage = one;
        break;
      case 2:
        firstImage = two;
        break;
      case 3:
        firstImage = three;
        break;
      case 4:
        firstImage = four;
        break;
      case 5:
        firstImage = five;
        break;
      case 6:
        firstImage = six;
        break;
    }
    switch (anotherRandom) {
      case 1:
        secondImage = one;
        break;
      case 2:
        secondImage = two;
        break;
      case 3:
        secondImage = three;
        break;
      case 4:
        secondImage = four;
        break;
      case 5:
        secondImage = five;
        break;
      case 6:
        secondImage = six;
        break;
    }
    setState(() {
      HomeImage1 = firstImage;
      HomeImage2 = secondImage;
      if(HomeImage1 == HomeImage2){
        answer = "Dice Matched";
      }else{
        answer = "No Luck Yet";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5D76E),
      appBar: AppBar(
        title: Text("Dice Roller",style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFFCA6924),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(answer, style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 38.0,
              ),),
              Container(
                margin: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: HomeImage1,
                      width: 150.0,
                      height: 150.0,
                    ),
                    Image(
                      image: HomeImage2,
                      width: 150.0,
                      height: 150.0,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                  child: Text('Roll Me', textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  ),
                  color: Color(0xFFE2B13C),
                  onPressed: diceChanger,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
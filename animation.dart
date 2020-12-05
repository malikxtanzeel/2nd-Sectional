import 'package:dicee/dice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<DiceModel>(
          child: DicePage(),
          create: (BuildContext context) => DiceModel(),
        )),
  );
}

class DicePage extends StatelessWidget {
  void updateDices(DiceModel dice) {
    for (int i = 0; i < 6; i++) {
      print(i);
      sleep(Duration(milliseconds: 1000));
      dice.generateDiceOne();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _diceOneImages = [
      "images/dice1.png",
      "images/dice2.png",
      "images/dice3.png",
      "images/dice4.png",
      "images/dice5.png",
      "images/dice6.png",
    ];
    final dice = Provider.of<DiceModel>(context);
    final c = dice.diceOneCount;
    var img = Image.asset(
      _diceOneImages[c - 1],
      gaplessPlayback: true,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () => updateDices(dice),
                child: img,
              ),
            ),
          ],
        ),
      ],
    );
  }
}```

**DiceModel**

```import 'dart:math';

import 'package:flutter/foundation.dart';

class DiceModel with ChangeNotifier {
  int diceOne = 1;

  int get diceOneCount => diceOne;

  void generateDiceOne() {
    diceOne = Random().nextInt(5) + 1;
    print("diceOne: $diceOne");
    notifyListeners();
  }
}

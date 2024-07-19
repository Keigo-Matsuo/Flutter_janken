import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = 'さいしょはグー';
  int winCount = 0;
  int loseCount = 0;
  int drawCount = 0;

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    computerHand = generateComputerHand();
    judge();
    setState(() {});
  }

  String generateComputerHand() {
    final int randomNumber = Random().nextInt(3);
    return randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
      drawCount++;
    } else if (myHand == '✊' && computerHand == '✌' ||
        myHand == '✌' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      result = 'あなたの勝ち';
      winCount++;
    } else {
      result = 'あなたの負け';
      loseCount++;
    }
  }

  // 変数を初期値に戻す
  void resetGame() {
    myHand = '✊';
    computerHand = '✊';
    result = 'さいしょはグー';
    winCount = 0;
    loseCount = 0;
    drawCount = 0;
    setState(() {});
  }

  // 画面全体を再描画
  // void resetGame() {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(
  //       builder: (context) => const JankenPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(color: Colors.blue),
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "勝ち",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "引き分け",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          "負け",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          '$winCount',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          '$drawCount',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Center(
                        child: Text(
                          '$loseCount',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            result,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            computerHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            myHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {selectHand('✊')},
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                child: const Text('✊'),
              ),
              ElevatedButton(
                onPressed: () => {selectHand('✌')},
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                child: const Text('✌'),
              ),
              ElevatedButton(
                onPressed: () => {selectHand('✋')},
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                ),
                child: const Text('✋'),
              ),
            ],
          ),
          SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: () => {resetGame()},
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(Colors.yellow),
            ),
            child: const Text('リセット'),
          ),
        ],
      ),
    );
  }
}

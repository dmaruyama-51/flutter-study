import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
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
  String myHand = '✊️';
  String computerHand = '✊️';
  String result = '引き分け';
  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊️';
      case 1:
        return '✌️';
      case 2:
        return '✋️';
      default:
        return '✊️';
    }
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if ((myHand == '✊️' && computerHand == '✌️') ||
        (myHand == '✌️' && computerHand == '✋️') ||
        (myHand == '✋️' && computerHand == '✊️')) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  void selectHand(String selectedHand) {
    myHand = selectedHand;
    generateComputerHand();
    judge();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ジャンケン')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(result, style: TextStyle(fontSize: 32)),
            Text(computerHand, style: TextStyle(fontSize: 32)),
            Text(myHand, style: TextStyle(fontSize: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('✊️');
                  },
                  child: Text('✊️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋️');
                  },
                  child: Text('✋️'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

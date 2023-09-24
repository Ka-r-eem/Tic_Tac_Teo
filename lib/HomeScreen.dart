import 'package:flutter/material.dart';
import 'package:untitled/Login.dart';
import 'package:untitled/xoButton.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int player1Score = 0;

  int player2Score = 0;

  bool ScoreBoard = true;

  bool winner = false;

  String winn = '';

  List<String> Buttons = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)?.settings.arguments as HomeScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "XO",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Visibility(
            visible: ScoreBoard,
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.blue])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${arguments.player1Name} [X]',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Text("Score = $player1Score",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.black, Colors.blue],
                                transform: GradientRotation(3))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${arguments.player2Name} [O]',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25)),
                            Text("Score = $player2Score",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: winner,
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          winn,
                          style: const TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              startAgain();
                            },
                            child: const Text("Start Again")),
                        ElevatedButton(
                            onPressed: () {
                              startAgain();
                              Navigator.of(context).pushNamed(Login.routeName);
                            },
                            child: const Text("NEW GAME"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                xoButton(Buttons[0],
                    onPlayerClickCallBack: onPlayerClick, pos: 0),
                xoButton(Buttons[1],
                    onPlayerClickCallBack: onPlayerClick, pos: 1),
                xoButton(Buttons[2],
                    onPlayerClickCallBack: onPlayerClick, pos: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                xoButton(Buttons[3],
                    onPlayerClickCallBack: onPlayerClick, pos: 3),
                xoButton(Buttons[4],
                    onPlayerClickCallBack: onPlayerClick, pos: 4),
                xoButton(Buttons[5],
                    onPlayerClickCallBack: onPlayerClick, pos: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                xoButton(Buttons[6],
                    onPlayerClickCallBack: onPlayerClick, pos: 6),
                xoButton(Buttons[7],
                    onPlayerClickCallBack: onPlayerClick, pos: 7),
                xoButton(Buttons[8],
                    onPlayerClickCallBack: onPlayerClick, pos: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    if (Buttons[index].isNotEmpty) return;

    if (counter.isEven) {
      Buttons[index] = 'X';
    } else if (counter.isOdd) {
      Buttons[index] = 'O';
    }
    counter++;

    if (checkWinner('X')) {
      player1Score += 5;
      ScoreBoard = false;
      winner = true;
      winn = '[ X ] WINS !';
    } else if (checkWinner('O')) {
      player2Score += 5;
      ScoreBoard = false;
      winner = true;
      winn = '[ O ] WINS !';
    } else if (counter == 9) {
      ScoreBoard = false;
      winner = true;
      winn = "DRAW :)";
    }
    setState(() {});
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (Buttons[i] == playerSymbol &&
          Buttons[i + 1] == playerSymbol &&
          Buttons[i + 2] == playerSymbol) return true;
    }
    for (int i = 0; i < 3; i++) {
      if (Buttons[i] == playerSymbol &&
          Buttons[i + 3] == playerSymbol &&
          Buttons[i + 6] == playerSymbol) return true;
    }

    if (Buttons[0] == playerSymbol &&
        Buttons[4] == playerSymbol &&
        Buttons[8] == playerSymbol) return true;

    if (Buttons[2] == playerSymbol &&
        Buttons[4] == playerSymbol &&
        Buttons[6] == playerSymbol) return true;

    return false;
  }

  void startAgain() {
    ScoreBoard = true;
    winner = false;
    counter = 0;
    Buttons = ['', '', '', '', '', '', '', '', ''];
    setState(() {});
  }
}

class HomeScreenArguments {
  String player1Name;

  String player2Name;

  HomeScreenArguments(this.player1Name, this.player2Name);
}

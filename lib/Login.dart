import 'package:flutter/material.dart';
import 'package:untitled/HomeScreen.dart';

class Login extends StatelessWidget {
  static const String routeName = "Login";
  String player1 = '';
  String player2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "By Kareem Amin",
            style: TextStyle(color: Colors.blue, fontSize: 15),
          )),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: const Text(
                  "XO",
                  style: TextStyle(color: Colors.blue, fontSize: 70),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 70),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 2)),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                      child: TextField(
                          onChanged: (value) {
                            player1 = value;
                          },
                          style: const TextStyle(color: Colors.blue, fontSize: 25),
                          decoration: const InputDecoration(
                            hintText: "Player 1",
                            hintStyle:
                                TextStyle(color: Colors.blue, fontSize: 25),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.blue, width: 2)),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                      child: TextField(
                          onChanged: (value) {
                            player2 = value;
                          },
                          style: const TextStyle(color: Colors.blue, fontSize: 25),
                          decoration: const InputDecoration(
                            hintText: "Player 2",
                            hintStyle:
                                TextStyle(color: Colors.blue, fontSize: 25),
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 100 , horizontal: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                HomeScreen.routeName,
                                arguments: HomeScreenArguments(
                                    player1, player2));
                          },
                          style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.all(20))),
                          child: const Text(
                            "START",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

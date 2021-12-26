import 'package:flutter/material.dart';
import 'package:colours/colours.dart';
import 'dart:math';

class gamePage extends StatefulWidget {
  @override
  _gamePageState createState() => _gamePageState();
}

class _gamePageState extends State<gamePage> {
  MaterialColor backgroundColor = Colours.swatch('#589595');

  int player = 0;
  int phone = 0;
  int numberGames = 3;
  int playerScore = 0;
  int phoneScore = 0;

  var winLoseGame = "";

  Expanded imagesStnpepses(int number) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            player = number;
            phone = random();

            if ((player == 1 && phone == 3) ||
                (player == 3 && phone == 2) ||
                (player == 2 && phone == 1)) {
              setState(() {
                phoneScore++;
                numberGames--;
              });
            } else if ((player == 3 && phone == 1) ||
                (player == 2 && phone == 3) ||
                (player == 1 && phone == 2)) {
              setState(() {
                playerScore++;
                numberGames--;
              });
            } else {
              playerScore++;
              phoneScore++;
              numberGames--;
            }
          });
          if (numberGames == 0) {
            if (phoneScore > playerScore) {
              winLoseGame = "Lose";
            } else if (phoneScore < playerScore) {
              winLoseGame = "Win";
            } else {
              winLoseGame = "Draw";
            }
          }
          if (numberGames == -1) {
            newGame();
          }
        },
        child: Image.asset("images/icons$number.png"),
      ),
    );
  }

  CircleAvatar gamearea(player) {
    if (player == 0) {
      return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 83.0,
        child: CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 80.0,
        ),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 83.0,
        child: CircleAvatar(
          backgroundImage: AssetImage('images/icons$player.png'),
          radius: 80.0,
        ),
      );
    }
  }

  int random() {
    int min = 1;
    int max = 4;
    final rdm = Random();
    int rnd = min + rdm.nextInt(max - min);
    return rnd;
  }

  void newGame() {
    setState(() {
      phone = 0;
      player = 0;
      phoneScore = 0;
      playerScore = 0;
      numberGames = 3;
      winLoseGame = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33.0,
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 30.0,
                        child: Text(
                          "$playerScore",
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Player',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 65.0,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43.0,
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 40.0,
                        child: Text(
                          "$numberGames",
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                    )
                  ],
                ),
                const SizedBox(
                  width: 65.0,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 33.0,
                      child: CircleAvatar(
                        backgroundColor: backgroundColor,
                        radius: 30.0,
                        child: Text(
                          "$phoneScore",
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                gamearea(player),
                gamearea(phone),
              ],
            ),
            Text(
              winLoseGame,
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
            ),
            Row(
              children: [
                imagesStnpepses(1),
                imagesStnpepses(2),
                imagesStnpepses(3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

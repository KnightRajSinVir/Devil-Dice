import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0, life = 20, rb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0.0,
        title: const Row(
          children: [
            Text(
              "Devil's Dice",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Rubik',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            "  Rules:\n   1. A devil's dice has 20 faces. On rolling, a random number will be added to your counter from 1 to 20. \n"
                "   2. Your counter will clear from 2 rolls. For rolls further than 3, you will have to use your life.\n"
                "   3. If your final counter is below 14 or above 21, you lose life. Otherwise, you gain life.\n"
                "   4. You win when you get three 6s on your screen, excluding the number of rolls.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
              fontFamily: 'LeagueGothic',
            ),
          ),
          Text(
            winOrLose(counter, life),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 35,
              fontFamily: 'Rubik',
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "Counter: $counter ",
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 60,
              fontFamily: 'LeagueGothic',
            ),
          ),
          Text(
            "Rolls : $rb ",
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 40,
              fontFamily: 'LeagueGothic',
            ),
          ),
          (rb >= 2)
              ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.grey[900], backgroundColor: Colors.white, // foreground
            ),
            onPressed: () {
              setState(() {
                rb = 0;
                bool a = (counter > 21) == true;
                bool b = (counter < 14) == true;
                if (a || b) {
                  life = life - 3;
                } else {
                  switch (counter) {
                    case 14:
                      break;
                    case 15:
                      life = life + 1;
                      break;
                    case 16:
                      life = life + 2;
                      break;
                    case 17:
                      life = life + 3;
                      break;
                    case 18:
                      life = life + 4;
                      break;
                    case 19:
                      life = life + 5;
                      break;
                    case 20:
                      life = life + 6;
                      break;
                    case 21:
                      life = life + 7;
                      break;
                  }
                }
                counter = 0;
              });
            },
            child: const Text(
              'Clear the counter',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'LeagueGothic',
              ),
            ),
          )
              : const SizedBox(height: 40),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey[900], backgroundColor: Colors.red, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      if ((rb >= 3) == true) {
                        life = life - 10;
                        rb = rb + 1;
                        int score = Random().nextInt(20) + 1;
                        counter = counter + score;
                      }
                    });
                  },
                  child: Text(
                    'Life : $life',
                    style: const TextStyle(
                      fontSize: 60,
                      fontFamily: 'LeagueGothic',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey[900], backgroundColor: Colors.amber, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      if ((rb < 3) == true) {
                        int score = Random().nextInt(20) + 1;
                        rb = rb + 1;
                        counter = counter + score;
                      }
                    });
                  },
                  child: const Text(
                    'Roll !',
                    style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'LeagueGothic',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String winOrLose(int counter, int life) {
  if ((life == 666) == true) {
    return '\nYou Win';
  }
  if ((life == -666) == true) {
    return '\nYou Win';
  }
  if ((counter == 666) == true) {
    return '\nYou Win';
  }
  bool a = ((life == 66) == true);
  bool b = ((counter == 6) == true);
  bool c = ((life == 6) == true);
  bool d = ((counter == 66) == true);
  bool e = ((life == -66) == true);
  bool g = ((life == -6) == true);
  if (((a || e) && b) || ((c || g) && d)) {
    return '\nYou Win';
  }
  if ((life <= 0) == true) {
    return '\nYou Lose';
  }
  return "";
}

void score(int counter, int life) {
  bool a = (counter > 21) == true;
  bool b = (counter < 14) == true;
  if (a || b) {
    life = life - 3;
  }
}

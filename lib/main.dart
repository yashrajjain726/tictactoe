import 'package:flutter/material.dart';
import 'package:tictactoe/player.dart';

import 'homepage.dart';

void main() {
  runApp(const MyTicTacToe());
}

class MyTicTacToe extends StatelessWidget {
  const MyTicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>const HomePage(),
        '/player':(context)=>const Player()
      },
    );
  }
}

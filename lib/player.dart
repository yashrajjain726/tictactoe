import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool firstPlayerTurn = true;
  List<String> updatedText= ['','','','','','','','',''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                _updateTapValue(index);
              },
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Center(
                  child: Text(
                    updatedText[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
    );

  }
  void _updateTapValue(int index){
    setState(() {
      if(firstPlayerTurn==true) {
        updatedText[index] = "0";
        firstPlayerTurn = false;
      } else {
        updatedText[index] ="x";
        firstPlayerTurn = true;
      }
    });
  }
}


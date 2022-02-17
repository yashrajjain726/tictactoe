import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool firstPlayerTurn = true;
  List<String> updatedText = ['', '', '', '', '', '', '', '', ''];
  int firstPlayerScore = 0;
  int secondPlayerScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Player O",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          firstPlayerScore.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Player X",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            secondPlayerScore.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                padding: const EdgeInsets.all(50),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _updateTapValue(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white) ),
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void _updateTapValue(int index) {
    setState(() {
      if (firstPlayerTurn == true && updatedText[index] == '') {
        updatedText[index] = "o";
        firstPlayerTurn = false;
      } else if (firstPlayerTurn == false && updatedText[index] == '') {
        updatedText[index] = "x";
        firstPlayerTurn = true;
      }
      _checkTheWinner();
    });
  }

  void _checkTheWinner() {
    //first row
    if ((updatedText[0] != '') &&
        (updatedText[0] == updatedText[1]) &&
        (updatedText[0] == updatedText[2])) {
      _showWinningDialog(updatedText[0]);
    }
    //second row
     if ((updatedText[3] != '') &&
        (updatedText[3] == updatedText[4]) &&
        (updatedText[3] == updatedText[5])) {
      _showWinningDialog(updatedText[3]);
    }
    //third row
     if ((updatedText[6] != '') &&
        (updatedText[6] == updatedText[7]) &&
        (updatedText[6] == updatedText[8])) {
      _showWinningDialog(updatedText[6]);
    }
    //first column
     if ((updatedText[0] != '') &&
        (updatedText[0] == updatedText[3]) &&
        (updatedText[0] == updatedText[6])) {
      _showWinningDialog(updatedText[0]);
    }
    //second column
     if ((updatedText[1] != '') &&
        (updatedText[1] == updatedText[4]) &&
        (updatedText[1] == updatedText[7])) {
      _showWinningDialog(updatedText[1]);
    }
    //third column
     if ((updatedText[2] != '') &&
        (updatedText[2] == updatedText[5]) &&
        (updatedText[2] == updatedText[8])) {
      _showWinningDialog(updatedText[2]);
    }
    //check diagonal
    else if ((updatedText[6] != '') &&
        (updatedText[6] == updatedText[4]) &&
        (updatedText[6] == updatedText[2])) {
      _showWinningDialog(updatedText[6]);
    }
    // check diagonal
     if ((updatedText[0] != '') &&
        (updatedText[0] == updatedText[4]) &&
        (updatedText[0] == updatedText[8])) {
      _showWinningDialog(updatedText[0]);
    }
  }

  void _showWinningDialog(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is $winner"),
            actions: [
              TextButton(
                onPressed: (){
                  resetTicTacToe();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Play Again",
                ),
              )
            ],
          );
        });
  }

  void resetTicTacToe() {
    setState(() {
      for(int i=0;i<9;i++)
      {
        updatedText[i]='';
      }
    });
  }
}

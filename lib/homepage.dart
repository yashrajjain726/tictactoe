import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "TicTacToe",
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/player');
              },
              child: Text(
                "Click to Start".toUpperCase(),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.grey[900])),
            ),
          ),
        ],
      ),
    );
  }
}

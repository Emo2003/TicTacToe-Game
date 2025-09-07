import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final String player1;
  final String player2;
  final int scorePlayer1;
  final int scorePlayer2;

  const TopContainer({super.key , required this.player1, required this.player2 , required this.scorePlayer1,required this.scorePlayer2});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(player1 ,
                  style: TextStyle(fontSize: 20 ,
                      fontWeight: FontWeight.w600)
              ),
              Text(scorePlayer1.toString() ,
                  style: TextStyle(fontSize: 20 ,
                      fontWeight: FontWeight.w600))
            ],
          ),
          Column(
            children: [
              Text(player2,
                style: TextStyle(fontSize: 20 ,
                    fontWeight: FontWeight.w600),),
              Text(scorePlayer2.toString() ,
                  style: TextStyle(fontSize: 20 ,
                      fontWeight: FontWeight.w600))
            ],
          )
        ],
      ),
    );
  }
}

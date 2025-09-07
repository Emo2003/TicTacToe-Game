import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Widgets/BoardBtn.dart';
import 'package:tic_tac_toe/Widgets/BottomBtns.dart';
import 'package:tic_tac_toe/Widgets/TopContainer.dart';

import '../models/UserInput.dart';

class BoardPage extends StatefulWidget {
  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  int scorePlayer1=0;

  int scorePlayer2=0;


  List<String>inputs=[
    "","","",
    "","","",
    "","",""
  ];
 late String selectedPlayer ;
  late String player1 ;
  late String player2 ;
  late String message ;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    UserInput user = ModalRoute.of(context)!.settings.arguments as UserInput;
    selectedPlayer = user.selectedPlayer;
    player1 = user.player1;
    player2 = user.player2;

    message = "$player1 Turn";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffA949F2),
                  Color(0xff3304B3)
                ],
                stops: [0,1]
            )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
             TopContainer(player1: player1
                 , player2: player2,
                 scorePlayer1: scorePlayer1
                 , scorePlayer2: scorePlayer2),
                SizedBox(height: 13,),
                Text(message , style: TextStyle(fontSize: 36
                    , fontWeight: FontWeight.w700
                    , color: Colors.white),),
                SizedBox(height: 16,),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(44)
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(index:0 ,title: inputs[0],
                                onTap:DrawInputs ,),
                              VerticalDivider(color: Colors.black, thickness: 2,),
                              BoardBtn(index: 1,title: inputs[1], onTap:DrawInputs,
                               ),
                              VerticalDivider(color: Colors.black, thickness: 2,),

                              BoardBtn(index: 2,title:inputs[2], onTap:DrawInputs,
                                 ),

                            ],
                          ),
                        ),
                        Divider(color: Colors.black, thickness: 2,height: 0,),
                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(index: 3,title:inputs[3], onTap:DrawInputs
                                 ),
                              VerticalDivider(color: Colors.black, thickness: 2,),

                              BoardBtn(index: 4,title:inputs[4], onTap:DrawInputs
                              ),
                              VerticalDivider(color: Colors.black, thickness: 2,),

                              BoardBtn(index: 5, title: inputs[5], onTap:DrawInputs,
                                 ),

                            ],
                          ),
                        ),
                        Divider(color: Colors.black, thickness: 2,height: 0,),

                        Expanded(
                          child: Row(
                            children: [
                              BoardBtn(index: 6,title: inputs[6], onTap:DrawInputs,
                                 ),
                              VerticalDivider(color: Colors.black, thickness: 2,),

                              BoardBtn(index: 7,title: inputs[7], onTap:DrawInputs,
                                ),
                              VerticalDivider(color: Colors.black, thickness: 2,),

                              BoardBtn(index: 8,title: inputs[8], onTap:DrawInputs,
                                 ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                BottomBtns(onTap: Reset, backgroundColor:Color(0xffA949F2) , text:"Restart Game" ),
                SizedBox(height: 16,),
                BottomBtns(onTap:(){
                  Navigator.of(context).pop(context);
                } , backgroundColor:  Color(0xffA1AFD1FF), text: "    Close Game    ", end: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
int counter=0;
  DrawInputs(int index){
    if(inputs[index].isEmpty){
  setState(() {
    if (counter.isEven) {
      inputs[index] = selectedPlayer;
      message = "$player2 Turn";
    }
    else {
      inputs[index] = selectedPlayer == "x" ? "o" : "x";
      message = "$player1 Turn";
    }
    if(WhoWinner(selectedPlayer)){
      message="$player1 Win 🎉";
      scorePlayer1++;
      return;
    }
    else if(WhoWinner(selectedPlayer== "x" ? "o" : "x")){
   message="$player2 Win 🎉";
   scorePlayer2++;
   return;
    }
    counter++;
  });
    }
 }
bool WhoWinner(String player){
    for(int i=0;i<=6;i+=3){
      if(inputs[i]==player&&inputs[i+1]==player&&inputs[i+2]==player){
        return true;
      }
    }
    for(int i=0;i<=2;i++){
      if(inputs[i]==player&&inputs[i+3]==player&&inputs[i+6]==player){
        return true;
      }
    }
    if(inputs[0]==player&&inputs[4]==player&&inputs[8]==player){
      return true;
    }

    if(inputs[2]==player&&inputs[4]==player&&inputs[6]==player){
      return true;
    }
return false;
 }
 Reset(){
      setState(() {
        inputs=[
          "","","",
          "","","",
          "","",""
        ];
        message="$player1 Turn";
        counter=0;
      });

    
 }
}

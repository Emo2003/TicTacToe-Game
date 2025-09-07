import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/Pages/BoardPage.dart';
import 'package:tic_tac_toe/Widgets/LoginText.dart';
import 'package:tic_tac_toe/Widgets/TextFields.dart';
import 'package:tic_tac_toe/models/UserInput.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController player1Controller = TextEditingController();
  TextEditingController player2Controller = TextEditingController();
  String selectedPlayer ="";

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(alignment: Alignment.center,
                  children: [
                  Image.asset("assets/images/background.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  height: 0.47*height,
                  ),
                   LoginText(),

                ],),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      TextFields(name: "Player1 Name" , controller: player1Controller,),
                      SizedBox(height: 16,),
                      TextFields(name: "Player2 Name" , controller: player2Controller,),
                      SizedBox(height: 16,),
                     Text("Pick who goes first?" ,
                       style: TextStyle(fontSize: 24 ,
                           fontWeight: FontWeight.w500 ,
                           color: Colors.white),),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                       InkWell(
                         onTap: (){
                           setState(() {
                             selectedPlayer="x";
                           });
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             color: selectedPlayer=="x"?Colors.white:Colors.transparent ,
                            borderRadius: BorderRadius.circular(16)
                           ),
                           padding: EdgeInsets.all(25),
                           child: SvgPicture.asset("assets/images/x.svg"),
                         ),
                       ),
                       InkWell(
                         onTap: (){
                           setState(() {
                             selectedPlayer="o";
                           });
                         },
                         child: Container(
                           padding: EdgeInsets.all(25),
                           decoration: BoxDecoration(
                               color: selectedPlayer=="o"
                              ?Colors.white:
                               Colors.transparent,
                               borderRadius: BorderRadius.circular(16)
                           ),
                           child: SvgPicture.asset("assets/images/o.svg"),
                         ),
                       )
                      ],),
                      SizedBox(height: 16,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF4B52E),
                             padding: EdgeInsets.all(7)
                        ),
                          onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BoardPage() ,
                            settings: RouteSettings(
                                arguments: UserInput(
                                    player1:player1Controller.text ,
                            player2: player2Controller.text,
                            selectedPlayer: selectedPlayer))));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Spacer(),
                              Text("Play " , style: TextStyle(fontSize: 30 ,
                                  fontWeight: FontWeight.w700 ,
                                  color: Color(0xff210045)),),

                              Icon(Icons.play_arrow , color: Color(0xff210045), size: 35,)
                              ,Spacer(),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}

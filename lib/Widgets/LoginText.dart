import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("TicTacToe", style:
        TextStyle(fontSize: 40 ,
            fontWeight: FontWeight.w900 ,
            foreground: Paint()
              ..style=PaintingStyle.stroke
              ..strokeWidth=24
              ..color=Colors.white
        ),
        ),
        Text("TicTacToe", style:
        TextStyle(fontSize: 40 ,
            fontWeight: FontWeight.w900 ,
            foreground: Paint()
              ..style=PaintingStyle.stroke
              ..strokeWidth=17
              ..color=Color(0xff210045)
        ),
        ),
       const Text("TicTacToe", style:
        TextStyle(fontSize: 40 ,
          fontWeight: FontWeight.w900 ,
          color: Color(0xffF4B52E) ,
        ),
        )
      ],
    );
  }
}

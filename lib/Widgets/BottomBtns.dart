import 'package:flutter/material.dart';

class BottomBtns extends StatelessWidget {
  final String text;
  final bool end;
  final Function onTap;
  final Color backgroundColor;
  const BottomBtns({super.key ,required this.onTap,required this.backgroundColor, required this.text, this.end=false} );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){onTap();},
      child: Container(
        padding:const  EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16)
        ),
        child: end?Text(text
          , style: const TextStyle(fontSize: 24
              , fontWeight: FontWeight.w700,
              color: Colors.white),):
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [

          const  Icon(Icons.restart_alt, size: 30, color: Colors.white,),
           const SizedBox(width: 10,)
            , Text(text
              , style:const TextStyle(fontSize: 24
                  , fontWeight: FontWeight.w700,
                  color: Colors.white),)

          ],
        ),
      ),
    );
  }
}

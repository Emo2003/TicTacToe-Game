import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardBtn extends StatelessWidget {
  final String title;
  final Function(int) onTap;
  final int index;

  const BoardBtn({super.key , required this.index,required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          onTap: (){
            onTap(index);
            },
          child: Container(
            child: title.isNotEmpty? SvgPicture.asset(title=="x"?"assets/images/x.svg":"assets/images/o.svg")
            : null,
          ),
        ));
  }
}

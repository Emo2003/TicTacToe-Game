import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String name;
  TextEditingController controller;
   TextFields({super.key , required this.name , required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style:TextStyle(color: Colors.black ,
          fontSize: 20 ,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          fillColor: Color(0xffFFF3CD),
          filled: true,
          hintText: name,
          hintStyle: TextStyle(color: Colors.black ,
              fontSize: 16 ,
              fontWeight: FontWeight.w500)
          , border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none
      )
      ),
    );
  }
}

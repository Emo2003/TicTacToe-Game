import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
 final  String name;
  final TextEditingController controller;
   const TextFields({super.key , required this.name , required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style:const TextStyle(color: Colors.black ,
          fontSize: 20 ,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          fillColor: const Color(0xffFFF3CD),
          filled: true,
          hintText: name,
          hintStyle:const  TextStyle(color: Colors.black ,
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

import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
 
  });
final Icon prefixIcon;
final String hintText;
  final TextEditingController controller;




  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Color(0xff914576),
      ),
      
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color(0xff914576)),
        prefixIcon:  Padding(
          padding: EdgeInsets.only(left: 25, right: 11),
          child: prefixIcon,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff914576),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xff914576),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget{
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;

  const TextFieldInput({super.key, this.isPass = false, required this.hintText, required this.icon, required this.textEditingController});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        obscureText: isPass,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.brown.shade200,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.brown.shade200,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.orange.shade50,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.brown.shade100
            ),
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }
}
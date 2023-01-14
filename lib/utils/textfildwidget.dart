import 'package:flutter/material.dart';

class textfiled extends StatelessWidget {


  final controller;
  final obsecuretext;
  final title;

  const textfiled({super.key, this.controller, this.obsecuretext, this.title});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        obscureText: obsecuretext,
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: title),
      ),
    );
  }
  
}
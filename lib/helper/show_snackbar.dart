import 'package:flutter/material.dart';

//i moved it here because i will use it alot
void ShowSnackBar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)
       // 'The password provided is too weak.')
      ,)
      ,
      );
  }
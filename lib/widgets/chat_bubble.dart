import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class chat_bubble extends StatelessWidget {
  const chat_bubble({super.key,required this.message});//i make it reqired because i can't build text widget without text comes from message model
  
 final Message message;

  @override
  Widget build(BuildContext context) {
    //Listview.builder forced the width of the container to take the width of the screen
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // height: 65,
        // width: 150,
        //alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12,top: 32,bottom: 32,right: 32),
        margin: const EdgeInsets.all(8),//we can use sizebox here insteed of it but we should wrap this widget with column
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          
          ),
          color: kPrimaryColor
        ),
        child: Text(
          message.message,
        style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}

class chat_bybble_from_friend extends StatelessWidget {
  const chat_bybble_from_friend({super.key,required this.message});//i make it reqired because i can't build text widget without text comes from message model
  
 final Message message;

  @override
  Widget build(BuildContext context) {
    //Listview.builder forced the width of the container to take the width of the screen
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        // height: 65,
        // width: 150,
        //alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12,top: 32,bottom: 32,right: 32),
        margin: const EdgeInsets.all(8),//we can use sizebox here insteed of it but we should wrap this widget with column
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          
          ),
          color: Color(0xff006D84)//006D84
        ),
        child: Text(
          message.message,
        style: const TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}
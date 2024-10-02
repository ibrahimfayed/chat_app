import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//i seperate it because i will use it a lot of times
class CustumBotton extends StatelessWidget {
  CustumBotton({super.key, this.onTap,required this.text});

VoidCallback? onTap;//i make it as variable because i may use it in another places
String text;//it must be required

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container( //it is prefered to use container here rather than using button to control the shape better if the shape is special
             decoration: BoxDecoration(
              color: Colors.white
             , borderRadius: BorderRadius.circular(8)
             ),
              height: 60,
              width: double.infinity,//to take the width of whole screen
              child: Center(child: Text(text)),
              
             ),
    );
  }
}
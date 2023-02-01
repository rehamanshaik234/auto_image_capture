import 'package:flutter/material.dart';

class ShowMessage{
  static displayMessage(String message,BuildContext context,Color color){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "$message", style: TextStyle(color: color),),backgroundColor: Colors.grey.shade400,)
    );
  }
}
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget{
  final String buttonName;
  VoidCallback onPress;

  MyButton({
    super.key,
    required this.buttonName,
    required this.onPress
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPress,
      child:Text(buttonName) ,
      color: Theme.of(context).primaryColor,
    );
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/utils/my_buttons.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //text
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Add Task",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.grey.shade700)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide:
                          const BorderSide(color: Colors.green, width: 3))),
            ),

            //save -- cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(buttonName: "Add", onPress: onSave),
                const SizedBox(
                  width: 8,
                ),
                MyButton(buttonName: "cancel", onPress: onCancle)
              ],
            )
          ],
        ),
      ),
    );
  }
}

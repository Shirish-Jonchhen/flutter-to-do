import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.isCompleted,
    required this.onChange,
    required this.deleteTask
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                //check box
                Checkbox(
                    value: isCompleted,
                    onChanged: onChange,
                  activeColor: Colors.black,
                ),
                //task name
                Text(taskName,
                style: TextStyle(
                    decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 20
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
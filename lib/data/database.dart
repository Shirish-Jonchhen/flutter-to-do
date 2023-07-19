import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  final _myBox = Hive.box('myBox');
  List toDoList = [];

  //1st time opening this app
  void createInitialData(){
    toDoList = [
      ['Add Tasks', false]
    ];
  }

  void loadData(){
    var box = _myBox.get("TODOLIST");
    if(box!= null) {
      toDoList = _myBox.get("TODOLIST");
    }
  }

  void updateData(){
    _myBox.put("TODOLIST", toDoList);
  }
}
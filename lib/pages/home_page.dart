import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'utils/todo_tile.dart';
import 'utils/dailog_box.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final _myBox = Hive.box("myBox");
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //1st tym opening app
    db.loadData();

    if(_myBox.get("TODOLIST") == []){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        title: Center(child: Text("TO DO", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
        elevation: 5,
        toolbarHeight: 70,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            isCompleted: db.toDoList[index][1],
            onChange: (value) => onBoxChanged(value, index),
          deleteTask: (context) => deleteTask(index),);
        },

        itemCount: db.toDoList.length,
      )
    );
  }

  onBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void addTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
              controller: _controller,
            onSave: saveTask,
            onCancle: (){
                Navigator.of(context).pop();
                _controller.clear();
            },
          );
        }
    );
  }

  void saveTask(){
    setState(() {
      db.toDoList.add([_controller.text.trim(), false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateData();
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_usinghive/components/dialogbox.dart';
import 'package:to_do_usinghive/components/todo_listtile.dart';
import 'package:to_do_usinghive/data/database.dart';

class To_Do_Home extends StatefulWidget {
  const To_Do_Home({super.key});

  @override
  State<To_Do_Home> createState() => _To_Do_HomeState();
}

class _To_Do_HomeState extends State<To_Do_Home> {
  final _ToDoBox = Hive.box('ToDoBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_ToDoBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //theres already exists a data
      db.loadData();
    }
    super.initState();
  }

  final todocontroller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            title: Text(
              'TO DO',
              style: GoogleFonts.sedgwickAve(fontSize: 30)
            ),
            elevation: 0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask(index),
              );
            }));
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog_box(
            controller: todocontroller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([todocontroller.text, false]);
      todocontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
}

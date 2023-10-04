import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList=[
  ];
  ///reffernce our box
  final _ToDoBox=Hive.box('ToDoBox');


//running the app for the first time

  void createInitialData(){
 toDoList=[
   ["Learn Coding",false],
    ["Exercise",false]
 ];
  }

  //load the data from the data base
void loadData(){
toDoList=_ToDoBox.get("TODOLIST");
}
//update the database
void updateDataBase(){
    _ToDoBox.put("TODOLIST", toDoList);
}
}
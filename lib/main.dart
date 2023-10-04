import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_usinghive/to_do_hive/to_do_home.dart';
void main()async{
  /// initilize hive
 await Hive.initFlutter();
 ///open the box
 var Box = await Hive.openBox('ToDoBox');
  runApp(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        debugShowCheckedModeBanner: false,
        home: MainPage(),));
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: To_Do_Home(),

    );
  }
}

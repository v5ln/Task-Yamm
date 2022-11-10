import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_yamm/screen/Home.dart';
import 'package:todo_yamm/screen/LogIn.dart';

import 'model/ItemList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ItemList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 190, 109, 205),
          body: Login(),
        ),
        routes: <String, WidgetBuilder>{
          // Set routes for using the Navigator.
          // '/home': (BuildContext context) => new Home(),
          // '/login': (BuildContext context) => new LoginPage()
        },
      ),
    );
  }
}

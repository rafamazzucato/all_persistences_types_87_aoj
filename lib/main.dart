import 'package:all_persistences_types/firebase/list.dart';
import 'package:all_persistences_types/floor/list.dart';
import 'package:all_persistences_types/screens/home.dart';
import 'package:all_persistences_types/sqlite/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeWidget(),
        "/sqlite": (context) => const ListSQLiteWidget(),
        "/floor": (context) => const ListFloorWidget(),
        "/firebase": (context) => const ListCarFirestoreWidget(),
      },
    );
  }
}

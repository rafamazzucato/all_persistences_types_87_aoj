import 'package:all_persistences_types/utils/customWidgets.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  final title = const Text("Flutter Persistências");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: buildSvgIcon("images/sqlite-icon.svg"),
            title: const Text("SQLite"),
            subtitle: const Text("Lista de Pessoas"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, "/sqlite");
            },
          ),
          divisorListMain(),
          ListTile(
            leading: buildSvgIcon("images/db.svg"),
            title: const Text("Floor"),
            subtitle: const Text("Lista de Livros"),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, "/floor");
            },
          ),
          divisorListMain()
        ],
      ),
    );
  }
}

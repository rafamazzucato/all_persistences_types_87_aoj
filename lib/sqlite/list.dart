import 'package:all_persistences_types/sqlite/add.dart';
import 'package:all_persistences_types/sqlite/models/person.dart';
import 'package:flutter/material.dart';

class ListSQLiteWidget extends StatefulWidget {
  const ListSQLiteWidget({Key? key}) : super(key: key);

  final title = const Text("SQLite - Lista Pessoas");

  @override
  _ListSQLiteWidgetState createState() => _ListSQLiteWidgetState();
}

class _ListSQLiteWidgetState extends State<ListSQLiteWidget> {
  List<Person> persons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPerson()))
                    .then((person) {
                      setState(() {
                        persons.add(person);  
                      });
                  });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: buildListItem(),
      ),
    );
  }

  List<Widget> buildListItem() {
    return persons
        .map((p) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                  leading: Text(p.id != null ? p.id.toString() : "-1"),
                  title: Text(p.firstName),
                  subtitle: Text(p.lastName)),
            )))
        .toList();
  }
}

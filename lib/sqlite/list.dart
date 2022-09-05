import 'package:all_persistences_types/sqlite/add.dart';
import 'package:all_persistences_types/sqlite/daos/PersonDao.dart';
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
  late PersonDao dao;

  @override
  void initState() {
    super.initState();
    dao = PersonDao();
    getAllPersons();
  }

  getAllPersons() async {
    final result = await dao.readAll();
    setState(() {
      persons = result;
    });
  }

  insertPerson(Person person) async {
    final id = await dao.insertPerson(person);
    if (id > 0) {
      setState(() {
        person.id = id;
        persons.add(person);
      });
    }
  }

  deletePerson(int index) async {
    Person p = persons[index];
    if (p.id != null) {
      await dao.deletePerson(p.id!);
      setState(() {
        persons.removeAt(index);
      });
    }
  }

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
                    insertPerson(person);
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildListItem(index),
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: persons.length),
    );
  }

  Widget buildListItem(int index) {
    Person p = persons[index];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
              leading: Text(p.id != null ? p.id.toString() : "-1"),
              title: Text(p.firstName),
              subtitle: Text(p.lastName),
              onLongPress: () {
                deletePerson(index);
              }),
        ));
  }
}

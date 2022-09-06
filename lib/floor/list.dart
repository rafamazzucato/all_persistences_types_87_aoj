import 'package:all_persistences_types/floor/add.dart';
import 'package:all_persistences_types/floor/daos/BookDao.dart';
import 'package:all_persistences_types/floor/models/Book.dart';
import 'package:flutter/material.dart';

import 'package:all_persistences_types/floor/database/appDatabase.dart';

class ListFloorWidget extends StatefulWidget {
  const ListFloorWidget({Key? key}) : super(key: key);

  final title = const Text("Floor - Lista de Livros");

  @override
  _ListFloorWidgetState createState() => _ListFloorWidgetState();
}

class _ListFloorWidgetState extends State<ListFloorWidget> {
  late BookDao dao;
  List<Book> books = [];

  @override
  void initState() {
    super.initState();

    getAll();
  }

  getAll() async {
    final database = await $FloorAppDatabase
        .databaseBuilder("app_floor_database.db")
        .build();

    dao = database.bookDao;
    if (dao != null) {
      final result = await dao.findAll();
      if (result.isNotEmpty) {
        setState(() {
          books = result;
        });
      }
    }
  }

  insert(Book book) async {
    if (dao != null) {
      final id = await dao.insertBook(book);
      if (id > 0) {
        book.id = id;
        setState(() {
          books.add(book);
        });
      }
    }
  }

  delete(int index) async {
    if (dao != null) {
      final book = books[index];
      await dao.deleteBook(book);
      setState(() {
        books.removeAt(index);
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
                        MaterialPageRoute(builder: (context) => AddBook()))
                    .then((book) {
                  setState(() {
                    insert(book);
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildListItem(index),
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: books.length),
    );
  }

  Widget buildListItem(int index) {
    Book p = books[index];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
              leading: Text(p.id != null ? p.id.toString() : "-1"),
              title: Text(p.name),
              subtitle: Text(p.author),
              onLongPress: () {
                delete(index);
              }),
        ));
  }
}

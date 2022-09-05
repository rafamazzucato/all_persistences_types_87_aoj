import 'package:all_persistences_types/floor/add.dart';
import 'package:all_persistences_types/floor/models/Book.dart';
import 'package:flutter/material.dart';

class ListFloorWidget extends StatefulWidget {
  const ListFloorWidget({Key? key}) : super(key: key);

  final title = const Text("Floor - Lista de Livros");

  @override
  _ListFloorWidgetState createState() => _ListFloorWidgetState();
}

class _ListFloorWidgetState extends State<ListFloorWidget> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    
    getAll();
  }

  getAll() async {
    
  }

  insert() async {
    
  }

  delete(int index) async {
    
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
                    //insert();
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

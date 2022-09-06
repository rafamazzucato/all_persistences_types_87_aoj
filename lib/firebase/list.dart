import 'package:all_persistences_types/firebase/add.dart';
import 'package:all_persistences_types/firebase/models/Car.dart';
import 'package:all_persistences_types/sqlite/add.dart';
import 'package:all_persistences_types/sqlite/models/person.dart';
import 'package:flutter/material.dart';

class ListCarFirestoreWidget extends StatefulWidget {
  const ListCarFirestoreWidget({Key? key}) : super(key: key);

  final title = const Text("Lista de carros");

  @override
  _ListCarFirestoreWidgetState createState() => _ListCarFirestoreWidgetState();
}

class _ListCarFirestoreWidgetState extends State<ListCarFirestoreWidget> {
  List<Car> cars = [];
  
  @override
  void initState() {
    super.initState();
    getAll();
  }

  getAll() async {
    
  }

  insert(Car car) async {
    
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
                        MaterialPageRoute(builder: (context) => AddCar()))
                    .then((car) {
                  setState(() {
                    insert(car);
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildListItem(index),
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemCount: cars.length),
    );
  }

  Widget buildListItem(int index) {
    Car c = cars[index];
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          child: ListTile(
              title: Text(c.name),
              subtitle: Text(c.brand),
              onLongPress: () {
                delete(index);
              }),
        ));
  }
}

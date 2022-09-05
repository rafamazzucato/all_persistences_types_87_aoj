
import 'dart:ffi';

import 'package:all_persistences_types/sqlite/models/person.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PersonDao {

  Future<Database> getDatabase() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), "person_database.db"),
      onCreate: ((db, version) {
        return db.execute("CREATE TABLE Person(id INTEGER PRIMARY KEY, "+
            "firstName Text, lastName Text, address Text)");
      }),
      version: 1
    );

    return db;
  }

  Future<List<Person>> readAll() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> maps = await db.query("Person");

    final result = List.generate(maps.length, (index){
      return Person(
        id: maps[index]['id'],
        firstName: maps[index]['firstName'], 
        lastName: maps[index]['lastName'], 
        address: maps[index]['address']);
    });

    return result;
  }

  Future<int> insertPerson(Person person) async{
    final db = await getDatabase();
    return db.insert("Person", person.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> deletePerson(int id) async{
    final db = await getDatabase();
    return db.delete("Person", where: " id = ?", whereArgs: [id]);
  }
}
import 'package:floor/floor.dart';

@entity
class Book {
  @primaryKey
  int? id;
  String name;
  String author;

  Book({required this.name, required this.author});
}
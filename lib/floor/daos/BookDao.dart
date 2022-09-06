
import 'package:all_persistences_types/floor/models/Book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {

  @Query("Select * From Book")
  Future<List<Book>> findAll();

  @insert
  Future<int> insertBook(Book book);

  @delete  
  Future<int> deleteBook(Book book);
}
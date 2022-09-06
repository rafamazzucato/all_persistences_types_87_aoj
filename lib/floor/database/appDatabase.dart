
import 'dart:async';

import 'package:all_persistences_types/floor/daos/BookDao.dart';
import 'package:all_persistences_types/floor/models/Book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'appDatabase.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase{
  BookDao get bookDao;
}
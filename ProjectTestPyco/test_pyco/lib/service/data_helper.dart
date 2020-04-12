import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testpyco/common/strings.dart';
import 'package:testpyco/model/user.dart';

class DataBaseHelper {
  Future<Database> database;

  DataBaseHelper() {
    configDB();
  }

  Future<Database> configDB() async {
    if (database == null) {
      database = openDatabase(
        join(await getDatabasesPath(), KEY_DB_TINDER),
        onCreate: (db, version) {
          // Run the CREATE TABLE statement on the database.
          db.execute(
            "CREATE TABLE $KEY_TB_USER(name TEXT, email TEXT, address TEXT,"
            " phone TEXT, gender TEXT, url TEXT)",
          );
        },
        version: 1,
      );
    }
    return database;
  }

  Future<bool> insertUser(User user) async {
    List<User> listUser = List();
    listUser = await getAllUser();
    for (User _user in listUser) {
      if (_user.name == user.name) {
        return false;
      }
    }
    final Database db = await configDB();
    await db.insert(
      KEY_TB_USER,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return true;
  }

  Future<List<User>> getAllUser() async {
    final Database db = await configDB();
    if (db != null) {
      final List<Map<String, dynamic>> maps = await db.query(KEY_TB_USER);
      return List.generate(maps.length, (i) {
        return User.fromMap(maps[i]);
      });
    }
    return null;
  }
}

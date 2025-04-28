import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseMng with ChangeNotifier {
  Database? db;
  final String _dbName = "list.db";

  final String _dateTable = "date";
  final String _cardTable = "card";
  final String _usageTable = 'usage';
  final String _presetTable = 'preset';

  DatabaseMng() {
    init();
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    List<Map<String, Object?>> t = await db.rawQuery("SELECT * FROM sqlite_master WHERE name=${_dateTable};");
    if(t.isEmpty) {
      await db.execute("CREATE TABLE ${_dateTable} (id INTEGER PRIMARY KEY, value TEXT)");
      await db.execute("CREATE TABLE ${_cardTable} (id INTEGER PRIMARY KEY, value TEXT)");
      await db.execute("CREATE TABLE ${_usageTable} (id INTEGER PRIMARY KEY, value TEXT)");
      await db.execute("CREATE TABLE ${_presetTable} (id INTEGER PRIMARY KEY, title TEXT, subtitle TEXT, iconIdx INTEGER)");
    }

    // populate data
    // await db.insert(...);
  }


  Future<void> init() async {
    log("message");
    db = await openDatabase(_dbName, onCreate: _onCreate);
  }
}
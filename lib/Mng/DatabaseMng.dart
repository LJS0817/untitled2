import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseMng with ChangeNotifier {
  Database? db;

  final String _dbName = "list.db";

  final String _dateTable = "date";
  final String _cardTable = "card";
  final String _usageTable = 'usage';
  final String _customTable = 'custom';

  DatabaseMng() {
    init();
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    Batch batch = db.batch();
    batch.execute("CREATE TABLE ${_dateTable} (date TEXT PRIMARY KEY, maxMoney INTEGER, usage INTEGER);");
    batch.execute("CREATE TABLE ${_cardTable} (id INTEGER PRIMARY KEY, name TEXT, usage INTEGER, maxMoney INTEGER, pin INTEGER);");
    batch.execute("CREATE TABLE ${_usageTable} (id INTEGER PRIMARY KEY, date INTEGER, cardID INTEGER, time INTEGER, title TEXT, sub TEXT, price INTEGER, money INTEGER, iconIdx INTEGER);");
    batch.execute("CREATE TABLE ${_customTable} (id INTEGER PRIMARY KEY, title TEXT, sub TEXT, iconIdx INTEGER);");
    batch.commit();
    // await db.insert(...);
  }

  _onOpen(Database db) async {

  }

  Future<List<int>> getInfo(int id) async {
    List<int> rst = [];
    List<Map<String, Object?>>? data = [];
    data = await db?.query(_cardTable, columns: ["name", "usage", "maxMoney"], where: 'id', whereArgs: [id]);
    print(data);
    return rst;
  }

  Future<void> init() async {
    db = await openDatabase(_dbName, version: 1, onCreate: _onCreate, onOpen: _onOpen);
    log("TEST");
    // await db!.insert(_cardTable, {'name' : '테스트 카드', 'usage' : 100000, 'maxMoney' : 300000});
    // log((await db!.query("sqlite_master")).map((row) => row['name'].toString()).toList(growable: false).toString());
  }
}
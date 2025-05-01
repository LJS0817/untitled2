import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseMng with ChangeNotifier {
  Database? db;

  final String _dbName = "list2.db";

  final String _cardTable = "card";
  final String _usageTable = 'usage';
  final String _customTable = 'custom';

  DatabaseMng() {
    // init();
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    Batch batch = db.batch();
    batch.execute("CREATE TABLE ${_cardTable} (id INTEGER PRIMARY KEY, name TEXT, current INTEGER, budget INTEGER, resetDate TEXT, pin INTEGER);");
    batch.execute("CREATE TABLE ${_usageTable} (id INTEGER PRIMARY KEY, date TEXT, title TEXT, detail TEXT, cost INTEGER, remain INTEGER, iconIdx INTEGER);");
    batch.execute("CREATE TABLE ${_customTable} (id INTEGER PRIMARY KEY, title TEXT, detail TEXT, iconIdx INTEGER, cost INTEGER);");
    batch.commit();
    // await db.insert(...);
  }

  _onOpen(Database db) async {

  }

  Future<List<Map<String, Object?>>> getInfo({int id = -1}) async {
    await init();
    List<Map<String, Object?>>? data = [];
    String query = "SELECT * FROM ${_cardTable}";
    if(id > -1) query += "WHERE id = ${id}";
    data = await db!.rawQuery(query);
    // data = await db?.query(_cardTable, columns: ["name", "usage", "maxMoney", "id"], where: 'id', whereArgs: [id]);
    return data;
  }

  Future<List<Map<String, Object?>>> getList(int id) async {
    return await db!.rawQuery("SELECT * FROM ${_usageTable} WHERE cardID = ${id}");
  }

  Future<void> init() async {
    if(db != null) return;
    db = await openDatabase(_dbName, version: 1, onCreate: _onCreate, onOpen: _onOpen);
    // db?.execute("ALTER TABLE ${_cardTable} ADD COLUMN resetDate TEXT");
    // await db?.execute("DROP TABLE ${_cardTable}");
    // await db?.execute("DROP TABLE ${_usageTable}");
    // await db?.execute("DROP TABLE ${_customTable}");
    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : '테스트', 'sub' : '서브테스트', 'price' : 10000, 'money' : 300000, 'iconIdx' : 2});
    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : '123', 'sub' : '1234567', 'price' : 10000, 'money' : 300000, 'iconIdx' : 3});
    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : 'abc', 'sub' : 'asvdzxc', 'price' : 10000, 'money' : 300000, 'iconIdx' : 4});
    log("TEST");
    // log((await db!.query("sqlite_master")).map((row) => row['name'].toString()).toList(growable: false).toString());
  }
}
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';

class DatabaseMng with ChangeNotifier {
  Database? db;

  final String _dbName = "list2.db";

  final String _cardTable = "card";
  final String _usageTable = 'usage';
  final String _customTable = 'custom';
  final String _configTable = "config";

  DatabaseMng() {
    // init();
  }

  _onCreate(Database db, int version) async {
    // Database is created, create the table
    Batch batch = db.batch();
    batch.execute("CREATE TABLE ${_cardTable} (id INTEGER PRIMARY KEY, name TEXT, current INTEGER, budget INTEGER, resetDate TEXT, pin INTEGER);");
    batch.execute("CREATE TABLE ${_usageTable} (id INTEGER PRIMARY KEY, date TEXT, title TEXT, detail TEXT, cost INTEGER, remain INTEGER, iconIdx INTEGER, cardID INTEGER, removed INTEGER);");
    batch.execute("CREATE TABLE ${_customTable} (id INTEGER PRIMARY KEY, title TEXT, detail TEXT, iconIdx INTEGER, cost INTEGER);");
    batch.execute("CREATE TABLE ${_configTable} (id INTEGER PRIMARY KEY, value INTEGER);");
    batch.commit();
    // await db.insert(...);
  }

  _onOpen(Database db) async {

  }

  Future<void> init() async {
    if(db != null) return;
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);
    db = await openDatabase(path, version: 1, onCreate: _onCreate, onOpen: _onOpen);
    // db!.execute("CREATE TABLE ${_configTable} (id INTEGER PRIMARY KEY, value INTEGER);");

    // await db!.execute("ALTER TABLE ${_usageTable} ADD COLUMN removed TEXT");

    // await db?.execute("DROP TABLE ${_cardTable}");

    // await db?.execute("DROP TABLE ${_usageTable}");
    // db?.execute("CREATE TABLE ${_usageTable} (id INTEGER PRIMARY KEY, date TEXT, title TEXT, detail TEXT, cost INTEGER, remain INTEGER, iconIdx INTEGER, cardID INTEGER, removed INTEGER);");

    // await db?.execute("DROP TABLE ${_customTable}");

    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : '테스트', 'sub' : '서브테스트', 'price' : 10000, 'money' : 300000, 'iconIdx' : 2});
    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : '123', 'sub' : '1234567', 'price' : 10000, 'money' : 300000, 'iconIdx' : 3});
    // await db!.insert(_usageTable, {'date' : DateFormat('yyyyMMdd').format(DateTime.now()), 'cardID' : 1, 'title' : 'abc', 'sub' : 'asvdzxc', 'price' : 10000, 'money' : 300000, 'iconIdx' : 4});
    // log((await db!.query("sqlite_master")).map((row) => row['name'].toString()).toList(growable: false).toString());
  }

  Future<List<Map<String, Object?>>> getCustom() async {
    await init();
    return await db!.rawQuery("SELECT * FROM $_customTable");
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

  Future<int> insertCustom(CustomDataframe data) async {
    return await db!.insert(_customTable, data.toMapWithoutId());
  }

  Future<int> updateCustom(CustomDataframe data) async {
    return await db!.update(_customTable, data.toMapWithoutId(), where: 'id=?', whereArgs: [data.getId()]);
  }

  Future<int> deleteCustom(int id) async {
    return await db!.delete(_customTable, where: 'id=?', whereArgs: [id]);
  }

  Future<int> insertCard(InfoDataframe info) async {
    return await db!.insert(_cardTable, info.toMapWithoutId());
  }

  Future<int> insertUsage(DataFrame data) async {
    return await db!.insert(_usageTable, data.toMapWithoutId());
  }
  
  Future<DataFrame> deleteUsage(DataFrame data, int cid, int cur, int newId) async {
    await updateCard({'current' : cur + data.getCost()}, cid);
    log("message                      " + data.toMap().toString());
    await db!.update(_usageTable, {'removed' : '1'}, where: 'id=?', whereArgs: [data.getId()]);
    data.setRemoved(2);
    data.setRemain(cur + data.getCost());
    data.setId(newId);
    await insertUsage(data);
    return data;
  }

  Future<int> updateCard(Map<String, Object> data, int id) async {
    return await db!.update(_cardTable, data, where: 'id=?', whereArgs: [id]);
  }
}
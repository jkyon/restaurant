import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:synchronized/synchronized.dart';

import 'dal.dart';

class DatabaseManager implements IDatabaseManager {
  DatabaseManager();

  String name = "restaurant.db";

  Database db;

  final _lock = Lock();

  @override
  Future<bool> create(String table, Map fields) async {
    var result = await db.insert(table, fields);
    return result > 0 ? true : false;
  }

  @override
  Future<int> delete(String table, dynamic id, String keyField) async {
    return await db.delete(table, where: "$keyField = ?", whereArgs: [id]);
  }

  @override
  Future<List<Map<String, dynamic>>> getRecord(
      String table, dynamic id, String keyField, List fields) async {
    return await db
        .query(table, columns: fields, where: "$keyField = ?", whereArgs: [id]);
  }

  @override
  Future<List<Map<String, dynamic>>> getRecords(String table,
      {List fields,
      String where,
      List whereArgs,
      String groupBy,
      String having,
      String orderBy,
      int limit,
      int offset}) async {
    return fields != null
        ? await db.query(table,
            columns: fields,
            where: where,
            whereArgs: whereArgs,
            groupBy: groupBy,
            having: having,
            orderBy: orderBy,
            limit: limit,
            offset: offset)
        : await db.query(table,
            where: where,
            whereArgs: whereArgs,
            groupBy: groupBy,
            having: having,
            orderBy: orderBy,
            limit: limit,
            offset: offset);
  }

  @override
  Future<bool> update(String table, Map fields, String keyField) async {
    var rowsUpdated = await db.update(table, fields,
        where: "$keyField = ?", whereArgs: [fields[keyField]]);

    return rowsUpdated > 0 ? true : false;
  }

  @override
  Future<bool> open() async {
    bool opened;

    if (db != null) {
      opened = db is Database && (db.path?.isNotEmpty ?? false);
    } else {
      var documentsDirectory = await getApplicationDocumentsDirectory();

      var dbPath = join(documentsDirectory.path, name);
      await _lock.synchronized(() async {
        try {
          db = await openDatabase(dbPath);

          opened = true;
        } catch (e) {
          opened = false;
        }
      });
    }

    return opened;
  }

  @override
  Future<void> close() async {
    // if (db != null) {
    //   await db.close();
    //   db = null;
    // }
  }

  static Future<bool> moveDatabaseToDocumentDir() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "restaurant.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      var data = await rootBundle
          .load(join("lib/src/resources/assets/db", "restaurant.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }

    return true;
  }
}

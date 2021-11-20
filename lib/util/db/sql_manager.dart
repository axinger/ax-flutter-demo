import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

/// 数据库管理

class SqlManager {
  static const _version = 1;

  static const _name = "axTest.db";

  static Database? _database;

  ///初始化
  static init() async {
    // open the database
    String databasesPath = await getDatabasesPath();
    print("databasesPath == ${databasesPath}");

    String path = databasesPath + _name;
    if (Platform.isIOS) {
      path = databasesPath + "/" + _name;
    }
    _database = await openDatabase(path, version: _version, onCreate: (Database db, int version) async {});
  }

  /**
   * 表是否存在
   */
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database?.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  ///获取当前数据库对象
  static Future<Database?> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }

  static deleteDb() async {
    // open the database
    var databasesPath = await getDatabasesPath();
    String path = databasesPath! + _name;
    if (Platform.isIOS) {
      path = databasesPath + "/" + _name;
    }
    await deleteDatabase(path);
  }
}

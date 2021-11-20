import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'abstract_json_object.dart';
import 'db_table.dart';
import 'sql_manager.dart';

///基类
class SqlProvider<T extends AbstractJsonObject> {
  bool isTableExits = false;
  DbTable dbTable;

  SqlProvider(this.dbTable);

  Future<Database> getDataBase() async {
    return await open();
  }

  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = (await SqlManager.getCurrentDatabase())!;
      return await db.execute(createSql);
    }
  }

  open() async {
    if (!isTableExits) {
      await prepare(dbTable.tableName, tableSqlString(dbTable));
    }
    return await SqlManager.getCurrentDatabase();
  }

  String tableSqlString(DbTable dbTable) {
    StringBuffer sql = StringBuffer();
    sql.write('create table IF NOT EXISTS ${dbTable.tableName} (');
    dbTable.columnlist.forEach((DbColumn dbColumn) {
      sql.write('${dbColumn.code}  ${dbColumn.type}');
      if (!dbColumn.nullable) {
        sql.write(' not null');
      }
      sql.write(',');
    });
    sql.write('${dbTable.idName}  integer primary key autoincrement)');
    return sql.toString();
  }

  ///保存
  Future<int> insertMap(Map<String, dynamic> object) async {
//    LogUtil.get().i('向本地缓存表${dbTable.tableName}中插入数据:${json.encode(object)}');
    Database db = await getDataBase();
    int id = await db.insert(dbTable.tableName, object);
    return id;
  }

  ///保存
  Future<int> insert(T object) async {
    int id = await insertMap(object.toJson());
    return id;
  }

  ///查询总数量
  Future<int> count({required String contion}) async {
//    LogUtil.get().i('查询本地表数据,表明${dbTable.tableName}条件:${contion}');
    Database db = await getDataBase();
    int size = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM ${dbTable.tableName}  ${contion}'))!;
    return size;
  }

  ///查询单个
  Future<Map<String, dynamic>> queryOne(
    String where,
    List<dynamic> whereArgs,
  ) async {
    print("where == ${where}");
    print("whereArgs == ${whereArgs}");
    List<Map<String, dynamic>> resultList = await query(
      where: where,
      whereArgs: whereArgs,
      limit: 1,
    );
    if (resultList.length > 0) {
      return resultList[0];
    }
    return Map();
  }

  ///查询--此处为了保证和原有接口一致,只是移除了表明属性,是否有必要
  Future<List<Map<String, dynamic>>> query(
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<dynamic>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
//    LogUtil.get().i('查询本地表数据,表名222${dbTable.tableName}');
    Database db = await getDataBase();
    List<Map<String, dynamic>> resultList = await db.query(dbTable.tableName,
        distinct: distinct,
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset);
    // List<Map<String, dynamic>> resultList2 = await db
    //     .rawQuery("SELECT * FROM t_base_config WHERE code='USER_INFO'")
    //     .then((onValue) {
    //   // print("SELECT == ${onValue}");
    // });

    List<Map<String, dynamic>> resultList3 = await db.rawQuery("SELECT * FROM t_base_config WHERE code='USER_INFO'");
    print("SELECT ==2 ${resultList3}");

    return resultList;
  }
}

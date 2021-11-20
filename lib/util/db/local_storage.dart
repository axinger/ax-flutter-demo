import 'package:sqflite/sqflite.dart';

import 'db_table.dart';
import 'object_util.dart';
import 'sql_provider.dart';

///本地存储工具类

DbTable _baseConfigTable = DbTable('t_base_config', [DbColumn('code'), DbColumn('val')]);

///SharedPreferences 本地存储
class LocalStorage {
  static SqlProvider sqlProvider = SqlProvider(_baseConfigTable);

  static save(String key, value) async {
    Map<String, dynamic> cacheInfo = {'code': key, 'val': value};
    sqlProvider.insertMap(cacheInfo);
  }

  static get(String key) async {
    Map<String, dynamic> cacheInfo = await sqlProvider.queryOne('code=?', [key]);
    if (ObjectUtil.isNotEmpty(cacheInfo)) {
      return cacheInfo['val'];
    } else {
      return null;
    }
  }

  static remove(String key) async {
    print("delete == $key");

    if (key == "USER_INFO") return;

    Database db = await sqlProvider.getDataBase();
    print("sqlProvider.dbTable.tableName == ${sqlProvider.dbTable.tableName}");
//    db.delete(sqlProvider.dbTable.tableName, where: 'code=?', whereArgs: [key]);
/*    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);*/
  }
}

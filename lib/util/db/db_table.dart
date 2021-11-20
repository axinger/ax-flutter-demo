class DbTable {
  String idName;
  String tableName;
  List<DbColumn> columnlist;

  DbTable(this.tableName, this.columnlist, {this.idName = 'id'});
}

class DbColumn {
  String code;
  String name;
  String type;
  bool nullable;

  DbColumn(this.code, {this.type = 'text', this.nullable = true, this.name = ''});
}

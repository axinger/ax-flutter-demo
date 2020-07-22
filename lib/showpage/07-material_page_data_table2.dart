import 'package:ax_flutter_demo/model/post_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialPaginatedDataTablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class PostDataSource extends DataTableSource {
  List<PostEntity> _dataList = List.from(PostEntity.dataList());

  int _selectedRowCount = 0;

  @override
  int get rowCount => _dataList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedRowCount;

  @override
  DataRow getRow(int index) {
    PostEntity entity = _dataList[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(entity.title)),
        DataCell(Image.network(entity.imageUrl)),
      ],
    );
  }

  void sort(bool sortAscending) {
    _dataList.sort((a, b) {
      if (sortAscending) {
        return a.title.compareTo(b.title);
      } else {
        return b.title.compareTo(a.title);
      }
    });
    notifyListeners();
  }

/* */ /*ascending 上升 这里排序 没看懂比较的是个啥*/ /*
  void _sort<T> (Comparable<T> getField(PostEntity d),bool ascending){
    _dataList.sort((PostEntity a, PostEntity b) {
      if (!ascending) {
        final PostEntity c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }*/
}

class _MaterialPage1 extends State<MaterialPaginatedDataTablePage> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分页DataTable"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,

              header: Text("头部"),

              /// 每页数量
              rowsPerPage: 5,

              /// 全选不用实现,已经实现看
//              onSelectAll: (bool select){
//                debugPrint("onSelectAll = $select");
//              },
              columns: [
                /// 头 列 ,序号,标题
//                DataColumn(
//                  label: Text("序号"),
//                ),
                DataColumn(
                  label: Text("标题"),
                  onSort: (int columnIndex, bool ascending) {
                    setState(
                      () {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;

                        /// 这里 调动 类的方法,不然不行...
                        _postDataSource.sort(ascending);
                      },
                    );
                  },
                ),
                DataColumn(
                  label: Text("图片"),
                ),
              ],

              /// 内容
              source: _postDataSource,
            ),
          ],
        ),
      ),
    );
  }
}

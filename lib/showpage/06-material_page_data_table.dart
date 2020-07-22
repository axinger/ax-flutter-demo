import 'package:ax_flutter_demo/model/post_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialDataTablePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialPage1();
  }
}

class _MaterialPage1 extends State<MaterialDataTablePage> {
  int _sortColumnIndex = 0;
  bool _sortAscending = false;

  List<PostEntity> dataList = List.from(PostEntity.dataList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,

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
                    setState(() {
                      _sortColumnIndex = columnIndex;
                      _sortAscending = ascending;

                      dataList.sort((a, b) {
                        if (_sortAscending) {
                          return a.title.compareTo(b.title);
                        } else {
                          return b.title.compareTo(a.title);
                        }
                      });
                    });
                  },
                ),
                DataColumn(
                  label: Text("图片"),
                ),
              ],

              /// 内容
              rows: dataList.asMap().keys.map((index) {
                PostEntity entity = dataList[index];

                return DataRow(

                    /// 是否选择
                    selected: entity.selected,

                    /// 点击选择变化
                    onSelectChanged: (bool select) {
                      setState(() {
                        entity.selected = select;
                      });
                    },

                    /// cells
                    cells: [
//                  DataCell(Text((index + 1).toString())),
                      DataCell(Text(entity.title)),
                      DataCell(Image.network(entity.imageUrl)),
                    ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

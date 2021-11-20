import 'package:flutter/material.dart';

class DemoTablePage extends StatefulWidget {
  const DemoTablePage({Key? key}) : super(key: key);

  @override
  _TableDemoPageState createState() => _TableDemoPageState();
}

class _TableDemoPageState extends State<DemoTablePage> {
  ScrollController _scroll = new ScrollController();

  bool flas = false;

  @override
  void initState() {
    super.initState();

    _scroll.addListener(() {
      if (_scroll.position.pixels >= _scroll.position.maxScrollExtent) {}
      //超过500，就显示返回顶部按钮，小于500就不展示

      if (_scroll.offset > 0) {
        setState(() {
          flas = true;
        });
      } else {
        setState(() {
          flas = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table,注意和DateTable区别"),
      ),
      body: Column(
        children: [
          Table(
//                border: TableBorder(
//                  top: BorderSide(color: Colors.red),
//                  left: BorderSide(color: Colors.red),
//                  right: BorderSide(color: Colors.red),
//                  bottom: BorderSide(color: Colors.red),
//                  horizontalInside: BorderSide(color: Colors.red),
//                  verticalInside: BorderSide(color: Colors.green),
//                ),
            border: TableBorder.all(color: Colors.red),

            children: [
              TableRow(
//                    decoration: BoxDecoration(
////                      color: Colors.orange,
//                    ),
                children: [
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('姓名', textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('性别', textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('性别', textAlign: TextAlign.center)),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Table(
//                border: TableBorder(
//                  top: BorderSide(color: Colors.red),
//                  left: BorderSide(color: Colors.red),
//                  right: BorderSide(color: Colors.red),
//                  bottom: BorderSide(color: Colors.red),
//                  horizontalInside: BorderSide(color: Colors.red),
//                  verticalInside: BorderSide(color: Colors.green),
//                ),
            border: TableBorder.all(color: Colors.red),

            /// row 指定宽度,未设置的,撑满
            columnWidths: {
              0: FixedColumnWidth(80),
              2: FixedColumnWidth(80),
            },
            children: [
              TableRow(
//                    decoration: BoxDecoration(
////                      color: Colors.orange,
//                    ),
                children: [
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('姓名', textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('性别', textAlign: TextAlign.center)),
                  ),
                  TableCell(
                    child: Padding(padding: EdgeInsets.all(10), child: Text('性别', textAlign: TextAlign.center)),
                  ),
                ],
              ),
            ]..addAll(List.generate(30, (index) {
                return TableRow(
                  children: [
                    TableCell(
                      child: Padding(padding: EdgeInsets.all(10), child: Text('姓名 - $index', textAlign: TextAlign.center)),
                    ),
                    TableCell(
                      child: Padding(padding: EdgeInsets.all(10), child: Text('性别 - $index', textAlign: TextAlign.center)),
                    ),
                    TableCell(
                      child: Padding(padding: EdgeInsets.all(10), child: Text('性别 - $index', textAlign: TextAlign.center)),
                    ),
                  ],
                );
              })),
          ))),
        ],
      ),
    );
  }
}

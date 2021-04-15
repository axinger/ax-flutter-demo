import 'package:flutter/material.dart';

class CellItem {
  int index;
  String title;
  String subTitle;
  final Function()? onTap;

  CellItem({
    this.index = 0,
    this.title = '',
    this.subTitle = '',
    this.onTap,
  });
}

class Cell extends StatelessWidget {
  final CellItem item;

  Cell(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                item.title,
                maxLines: 3,
              ),
              if (item.subTitle.length>0)  Text(
                item.subTitle,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      onTap: item.onTap,
    );
  }
}

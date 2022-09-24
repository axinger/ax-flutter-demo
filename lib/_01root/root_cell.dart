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
      onTap: item.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(border: Border.all(color: Colors.orange, width: 1.0), borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                item.title,
                maxLines: 3,
              ),
              if (item.subTitle.isNotEmpty)
                Text(
                  item.subTitle,
                  maxLines: 3,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

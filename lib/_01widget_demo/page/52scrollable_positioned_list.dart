import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class P52ScrollablePositionedList extends StatefulWidget {
  @override
  _ScrollablePositionedListState createState() => _ScrollablePositionedListState();
}

class _ScrollablePositionedListState extends State<P52ScrollablePositionedList> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    itemPositionsListener.itemPositions.addListener(() {
      print('监听 = ${itemPositionsListener.itemPositions.value.first.index}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('跳转指定位置'),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text('跳转至\n有动画'),
            onPressed: () {
              itemScrollController.scrollTo(index: 150, duration: Duration(seconds: 2), curve: Curves.easeInOutCubic);
            },
            // onPressed:null,
          ),
          TextButton(
            // onPressed:null,
            child: Text('跳转至\n无动画'),

            onPressed: () {
              itemScrollController.jumpTo(index: 10);
            },
          ),
        ],
      ),
      body: ScrollablePositionedList.builder(
        itemCount: 500,
        itemBuilder: (context, index) => Text('Item $index'),
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
      ),
    );
  }
}

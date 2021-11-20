import 'package:flutter/material.dart';

class P53DraggableScrollableSheet extends StatefulWidget {
  @override
  _P53DraggableScrollableSheetState createState() => _P53DraggableScrollableSheetState();
}

class _P53DraggableScrollableSheetState extends State<P53DraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖拽滚动布局'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583224371276&di=c8a9d759bdde3218aef0f24268f11ab2&imgtype=0&src=http%3A%2F%2Fi1.sinaimg.cn%2Fent%2Fr%2F2009-03-27%2FU2507P28T3D2441286F328DT20090327082744.jpg'),
              Container(
                height: 200,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text('电影介绍'),
              ),
            ],
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 1,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    color: Colors.blue[100],
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('评论 $index'));
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

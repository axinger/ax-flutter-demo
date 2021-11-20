import 'package:flutter/material.dart';

class P51NestedScrollView extends StatefulWidget {
  @override
  _P51NestedScrollViewState createState() => _P51NestedScrollViewState();
}

class _P51NestedScrollViewState extends State<P51NestedScrollView> {
  _mySliverAppBar() {
    return SliverAppBar(
      title: Text('NestedScrollView'),
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/image/A171.jpg',
          fit: BoxFit.cover,
        ),
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

  _myItem(int index) {
    return Container(
      color: Colors.yellow,
      child: ListTile(
        title: Text('List $index'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('NestedScrollView'),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _mySliverAppBar(),
            )
          ];
        },
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _myItem(index);
                    },
                    childCount: 15,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class P49DismissibleWidget extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('侧滑删除'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              items.removeAt(index);

              ScaffoldMessengerState().showSnackBar(SnackBar(content: Text("$item dismissed")));
            },
            // Show a red background as the item is swiped away
            background: Container(color: Colors.red),
            child: ListTile(title: Text('$item')),
          );
        },
      ),
    );
  }
}

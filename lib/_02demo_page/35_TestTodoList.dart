import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class P35TestTodoList extends StatefulWidget {
  @override
  _P35TestTodoListState createState() => _P35TestTodoListState();
}

class _P35TestTodoListState extends State<P35TestTodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text('aaaaa'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final todo = todos[index];
                    return Dismissible(
                      key: Key('$todo$index'),
                      onDismissed: (direction) => todos.removeAt(index),
                      child: ListTile(title: Text(todo)),
                      background: Container(color: Colors.red),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (controller.text.isNotEmpty) {
                todos.add(controller.text);
                controller.clear();
              }
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

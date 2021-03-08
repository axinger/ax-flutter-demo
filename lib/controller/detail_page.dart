import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/post_entity.dart';

class DetailPage extends StatelessWidget {
  final PostEntity postEntity;

  DetailPage({
    required this.postEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postEntity.title),
      ),
      body: Column(
        children: <Widget>[
          Image.network(postEntity.imageUrl),
          Container(
            padding: EdgeInsets.all(12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(postEntity.title),
                SizedBox(height: 20),
                Text("作者:" + postEntity.author),
              ],
            ),
          )
        ],
      ),
    );
  }
}

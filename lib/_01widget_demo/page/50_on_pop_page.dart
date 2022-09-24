import 'package:flutter/material.dart';

/**
 * 该应用程序显式创建一个导航器，并为其提供代表完整堆栈的页面列表。我们创建一个空的_selectedColor，
 * 以指示尚未选择任何颜色，因此我们最初不显示ColorScreen。当用户选择一种颜色时，
 * 我们通常会调用setState（）来向Flutter表示您希望再次调用build（）方法，该方法现在会创建一个堆栈，其顶部是ColorScreen。

    您可以在OnPopPage回调中更新状态，例如，如果用户弹出，则表示他们已“取消选择”当前颜色，因此我们不再希望显示该页面。

    如果Navigator 2.0看起来像Flutter的其余部分，那就是意图-它是声明性的，
    而Navigator 1.0则是必须的。这个想法是要在导航和Flutter的其余部分之间统一模型，
    同时解决许多问题并添加功能。实际上，这个小例子几乎不涉及Navigator 2.0的内容。
    有关详细信息，我强烈推荐有关Flutter中的声明式导航和路由的文章。

    另外，您对Navigator 1.0的现有使用将像今天一样继续使用，并且不会在短期内被删除。
    如果您喜欢该模型，则可以继续使用它。但是，如果您尝试使用Navigator 2.0，我们认为您会喜欢的。
 * */
class P50OnPopPage extends StatefulWidget {
  @override
  _P50OnPopPageState createState() => _P50OnPopPageState();
}

class _P50OnPopPageState extends State<P50OnPopPage> {
  Color _selectedColor = Colors.white;
  List<Color> _colors = [Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0'),
      ),
      body: Navigator(
        // you can see and decide on every page in this list
        pages: [
          MaterialPage(
            child: ColorListScreen(
              colors: _colors,
              onTapped: (color) => setState(() => _selectedColor = color),
            ),
          ),
          // ignore: unnecessary_null_comparison
          if (_selectedColor != null) MaterialPage(child: ColorScreen(color: _selectedColor)),
        ],
        onPopPage: (route, result) {
          print('result = $result');
          if (!route.didPop(result)) return false;
          setState(() => _selectedColor = result as Color);
          return true;
//        if(result is Color){
//          setState(() => _selectedColor = result);
//          return true;
//        }
//        return false;
        },
      ),
    );
  }
//  @override
//  Widget build(BuildContext context) => MaterialApp(
//    title: 'Navigator 2.0',
//    home: Navigator(
//      // you can see and decide on every page in this list
//      pages: [
//        MaterialPage(
//          child: ColorListScreen(
//            colors: _colors,
//            onTapped: (color) => setState(() => _selectedColor = color),
//          ),
//        ),
//        if (_selectedColor != null) MaterialPage(child: ColorScreen(color: _selectedColor)),
//      ],
//      onPopPage: (route, result) {
//        print('result = $result');
//        if (!route.didPop(result)) return false;
//        setState(() => _selectedColor = result as Color);
//        return true;
////        if(result is Color){
////          setState(() => _selectedColor = result);
////          return true;
////        }
////        return false;
//      },
//    ),
//  );
}

class ColorListScreen extends StatelessWidget {
  final List<Color>? colors;
  final void Function(Color color)? onTapped;

  ColorListScreen({
    this.colors,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Colors')),
        body: Column(
          children: [
            // you can see and decide on every color in this list
            for (final color in colors!)
              Expanded(
                child: GestureDetector(
                  child: Container(color: color),
                  onTap: () => onTapped!(color),
                ),
              )
          ],
        ),
      );
}

class ColorScreen extends StatelessWidget {
  final Color? color;

  const ColorScreen({
    this.color,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Color')),
        body: Container(
            color: color,
            child: TextButton(
              child: Text('返回'),
              onPressed: () {
                Navigator.pop(context, Colors.purple);
              },
            )),
      );
}

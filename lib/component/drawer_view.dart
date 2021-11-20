import 'package:flutter/material.dart';

/// 用户头像组件
class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          /*头像*/
//                DrawerHeader(
//                  decoration: BoxDecoration(
//                    color: Colors.grey[100],
//                  ),
//                  child: UserAccountsDrawerHeader(
//                    accountName: Text("阿星"),
//                  ),
//                ),

          UserAccountsDrawerHeader(
            accountEmail: Text("liui@qq.com"),
            currentAccountPicture: CircleAvatar(
//                    backgroundImage: Image.network("https://randomuser.me/api/portraits/women/17.jpg"),
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/17.jpg"),
            ),
            accountName: Text("阿星"),
//                  onDetailsPressed: (){
//                    debugPrint("点击头像");
//                  },
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              image: DecorationImage(
                  image: NetworkImage(
                      "http://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1580287162&t=b4a02f5698972112363b7ecb93dc3516"),
                  /*填充方式*/
                  fit: BoxFit.cover,
                  /*磨砂效果*/
                  colorFilter: ColorFilter.mode(
                    Colors.red.withOpacity(0.6),
                    BlendMode.hardLight,
                  )),
            ),
          ),

          ListTile(
            title: Text(
              "消息",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.orange,
              size: 22.0,
            ),
//                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
            onTap: () {
              /*隐藏抽屉*/
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text(
              "收藏",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.orange,
              size: 22.0,
            ),
//                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
            onTap: () {
              /*隐藏抽屉*/
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text(
              "设置",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.orange,
              size: 22.0,
            ),
//                  leading: Icon(Icons.message,color: Colors.orange,size: 22.0,),
            onTap: () {
              /*隐藏抽屉*/
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

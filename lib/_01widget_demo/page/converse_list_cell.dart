import 'package:ax_flutter_demo/model/converse_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///cell*/
class ConverseListCell extends StatelessWidget {
  ConverseListCell({
    required this.model,
    this.onPressed,
  });

  final ConverseModel model;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    /**头像*/
//    Image headIconImage;
//
//    if (model.headIcon.startsWith("http")) {
//      headIconImage = Image.network(model.headIcon, width: 60, height: 60,);
//    } else {
//      headIconImage =
//          Image.asset('assets/image/headIcon.png', width: 60, height: 60,);
//    }

    /**网络缓存图片库*/
    CachedNetworkImage headIconImage = CachedNetworkImage(
      width: 60,
      height: 60,
      imageUrl: model!.headIcon,
      placeholder: (context, url) => Image.asset(
        'assets/image/headIcon.png',
        width: 60,
        height: 60,
      ),
    );

//    Image headIconImage = Image.asset(
//        'assets/image/headIcon.png',
//        width: 60,
//        height: 60,
//      );

    /**未读红点view*/
    Container unReadMsgContainer = Container();

    if ((model.unreadCount ?? 0) > 0) {
      unReadMsgContainer = Container(
        width: 20,
        height: 20,
        /**垂直居中*/
        alignment: Alignment.center,
        /**装饰器,底线,背景色等*/
        decoration: BoxDecoration(
          /**圆角*/
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Text(model.unreadCount.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            )),
      );
    }

    /**InkResponse 手势容器*/
    return InkResponse(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        margin: EdgeInsets.only(
          top: 0,
        ),
        /**decoration有这个了,就不能写在外面  color: Colors.white, */
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            /**底部分割线*/
            bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              color: Colors.orange,
              child: Stack(
                /**超出不部分,显示*/
                clipBehavior: Clip.none,
                children: <Widget>[
                  /**头像*/
                  headIconImage,
//              Image.asset(
//              'assets/image/headIcon.png',
//                width: 60,
//                height: 60,
//              ),
                  ///可以有位置的
                  Positioned(
                    width: 20,
                    height: 20,
                    child: unReadMsgContainer,
                    right: -10,
                    top: -10,
                  ),
                ],
              ),
            ),

            /**用view 作为分割*/
            Container(
              width: 10,
            ),

            /**Expanded 自动收缩宽高 view*/
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title ?? '',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  Text(
                    model?.msg ?? '',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    ),
                    /**文字尾部省略,默认是截取,不显示多余的*/
                    overflow: TextOverflow.ellipsis,
                    /**多余文字显示行数*/
                    maxLines: 2,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              color: Colors.orange,
              child: /**时间 和 闹铃 view*/
                  Column(
                children: <Widget>[
                  /**model.time != null 显示Text,否则显示空的Container */
                  model.time == null
                      ? Container()
                      : Text(
                          model.time ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),

                  /**能影藏的view*/
                  Offstage(
                    /*是否隐藏*/
                    offstage: !(model.isDisturb ?? false),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: model.time != null ? 10 : 0,
                      ),
                      child: Image.asset(
                        "assets/image/live_logo.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

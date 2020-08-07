import 'dart:typed_data';
import 'dart:ui';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';

class P25MoreListViewPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<P25MoreListViewPage> {
  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();

  _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          rootWidgetKey.currentContext.findRenderObject();

      /// 设备分辨率
      double pixelRatio = window.devicePixelRatio;
      var image = await boundary.toImage(pixelRatio: pixelRatio);

      /// png格式
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

//      bool result = await ImageGallerySaver.saveImage(pngBytes); //这个是核心的保存图片的插件
//
//      showCupertinoCertainAlert(
//          context: context, title: result ? '保存成功' : '保存失败');
      return pngBytes;
    } catch (e) {
      print('截图失败 = $e');
    }
    return null;
  }

  /// 违法信息
  List<IllegalInfoDto> illegalInfoList = [];

  /// 交强险 历史理赔 list kindCode 0590交强险
  List<HisClaimDto> hisClaimDtoList_0590 = [];

  /// 商业 历史理赔 list  kindCode 0501商业险
  List<HisClaimDto> hisClaimDtoList_0501 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'listview拼接,子禁止滚动',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("截图"),
            onPressed: () {
              _capturePng();
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
          future: _netData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("等待..."),
              );
            } else {
              print("snapshot.data = ${snapshot.data}");

              /// 截图  ListView.builder 必须包裹一层滚动的视图,比如SingleChildScrollView
              return SingleChildScrollView(
                child: RepaintBoundary(
                  ///截图需要的key
                  key: rootWidgetKey,
                  child: Container(
                    color: Colors.orange,
                    child: Column(
                      children: <Widget>[
                        Text('22'),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 100,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('内容 - $index');
                              }),
                        ),
                        Text('33'),
                      ],
                    ),
                  ),
                ),
              );

//              return SingleChildScrollView(
//                ///截图控件
//                child: RepaintBoundary(
//                  ///截图需要的key
//                  key: rootWidgetKey,
//                  child: Container(
//                    color: Colors.white,
//                    child: Column(children: [
//                      _container(
//                        title: "交通违法信息",
//                        data: illegalInfoList,
//                        type: 0,
//                      ),
//                      _container(
//                        title: "交强险理赔信息",
//                        data: hisClaimDtoList_0590,
//                        type: 1,
//                      ),
//                      _container(
//                        title: "商业险理赔信息",
//                        data: hisClaimDtoList_0501,
//                        type: 1,
//                      ),
//                    ]),
//                  ),
//                ),
//              );

            }
          }),
    );
  }

  Future<String> _netData() async {
    await Future.delayed(Duration(seconds: 1));

    for (int index = 0; index < 2; index++) {
      IllegalInfoDto element = IllegalInfoDto();
      element?.violationCode = 'violationCode' + index.toString();
      element?.lossTime = 'lossTime' + index.toString();
      element?.peccancySort = 'peccancySort' + index.toString();
      element?.remark = 'remark' + index.toString();
      element?.decisionCode = 'decisionCode';
      element?.administrationArea = 'administrationArea' + index.toString();

      illegalInfoList.add(element);
    }

    for (int index = 0; index < 3; index++) {
      HisClaimDto element = HisClaimDto();
      element?.payCompany = 'payCompany' + index.toString();
      element?.policyNo = 'policyNo' + index.toString();
      element?.startDate = 'startDate' + index.toString();
      element?.endDate = 'endDate' + index.toString();
      element?.lossTime = 'lossTime' + index.toString();
      element?.endCaseTime = 'endCaseTime' + index.toString();
      element?.lossFee = 'lossFee' + index.toString();
      element?.accidentDeath = '1';
      element?.claimType = '1';
      element?.insurerArea = 'insurerArea' + index.toString();

      hisClaimDtoList_0590.add(element);
    }

    for (int index = 0; index < 2; index++) {
      HisClaimDto element = HisClaimDto();
      element?.payCompany = 'payCompany' + index.toString();
      element?.policyNo = 'policyNo' + index.toString();
      element?.startDate = 'startDate' + index.toString();
      element?.endDate = 'endDate' + index.toString();
      element?.lossTime = 'lossTime' + index.toString();
      element?.endCaseTime = 'endCaseTime' + index.toString();
      element?.lossFee = 'lossFee' + index.toString();
      element?.accidentDeath = '1';
      element?.claimType = '1';
      element?.insurerArea = 'insurerArea' + index.toString();

      hisClaimDtoList_0501.add(element);
    }
    print("___netData==========");

    return "1";
  }

  Container _container(
      {@required title, @required List<dynamic> data, int type}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          ///头部
          Container(
            padding: EdgeInsets.only(bottom: 12, top: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              title ?? "",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

          ///分割线
          Divider(
            height: 1,
          ),

          /// 内容
          ListView.separated(
            padding: EdgeInsets.only(bottom: 10),
            separatorBuilder: (context, index) {
              return Divider();
            },

            ///解决无限高度问题
            shrinkWrap: true,

            ///禁用滑动事件
            physics: NeverScrollableScrollPhysics(),
            itemCount: (data == null || data.length == 0) ? 1 : data.length,
            itemBuilder: (context, index) {
              return (data == null || data.length == 0)
                  ? Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          '未查询到相关数据',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: type == 0
                          ? illegalInfoCell(data[index])
                          : hisClaimDtoCell(data[index]),
                    );
            },
          ),
        ],
      ),
    );
  }

  illegalInfoCell(IllegalInfoDto element) {
    return Column(
      children: <Widget>[
        cellRow(title: "违法编号", value: element?.violationCode),
        cellRow(title: "违法时间", value: element?.lossTime),
        cellRow(title: "违法类型", value: element?.peccancySort),
        cellRow(title: "违法类型简称", value: element?.remark),
        cellRow(title: "决定书编号", value: element?.decisionCode),
        cellRow(title: "行政区域代码", value: element?.administrationArea),
      ],
    );
  }

  hisClaimDtoCell(HisClaimDto element) {
    return Column(
      children: <Widget>[
        cellRow(title: "保险公司", value: element?.payCompany),
        cellRow(title: "保单号", value: element?.policyNo),
        cellRow(title: "保险起期", value: element?.startDate),
        cellRow(title: "保险止期", value: element?.endDate),
        cellRow(title: "出险时间", value: element?.lossTime),
        cellRow(title: "结案时间", value: element?.endCaseTime),
        cellRow(
            title: "赔付金额",
            value: (element?.lossFee != null && element.lossFee.isNotEmpty)
                ? '¥${element?.lossFee}'
                : '',
            color: Colors.orange),
        cellRow(title: "是否死亡", value: element?.accidentDeathStr),
        cellRow(title: "理赔类型", value: element?.claimTypeStr),
        cellRow(title: "保单归属地", value: element?.insurerArea)
      ],
    );
  }

  cellRow({String title, String value, Color color}) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 89,
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox.fromSize(
            size: Size(47, 0),
          ),
          Expanded(
            child: Text(
              (value != null && value.isNotEmpty) ? value : '',
              style: TextStyle(fontSize: 14, color: color),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemModel {
  String title;
  dynamic value;
  bool isPlaceholder;

  _ItemModel({this.title, this.value, this.isPlaceholder = false});
}

class IllegalInfoDto {
  String administrationArea;
  String decisionCode;
  String lossAction;
  String lossTime;
  String peccancySort;
  String remark;
  String violationCode;

  IllegalInfoDto(
      {this.administrationArea,
      this.decisionCode,
      this.lossAction,
      this.lossTime,
      this.peccancySort,
      this.remark,
      this.violationCode});

  IllegalInfoDto.fromJson(Map<String, dynamic> json) {
    administrationArea = json['administrationArea'];
    decisionCode = json['decisionCode'];
    lossAction = json['lossAction'];
    lossTime = json['lossTime'];
    peccancySort = json['peccancySort'];
    remark = json['remark'];
    violationCode = json['violationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['administrationArea'] = this.administrationArea;
    data['decisionCode'] = this.decisionCode;
    data['lossAction'] = this.lossAction;
    data['lossTime'] = this.lossTime;
    data['peccancySort'] = this.peccancySort;
    data['remark'] = this.remark;
    data['violationCode'] = this.violationCode;
    return data;
  }
}

class HisClaimDto {
  ///是否发生交通死亡事故 1-是　0-否
  String accidentDeath;
  String areaCode;
  String claimType;
  String endCaseTime;
  String endDate;
  String insurerArea;

  ///险别代码（0501商业险；0590交强险）
  String kindCode;
  String lossFee;
  String lossTime;
  String payCompany;
  String policyNo;
  String startDate;

  String get accidentDeathStr {
    if (accidentDeath == '1') {
      return '是';
    } else {
      return '否';
    }
  }

  /// 理赔类型（0有责涉及死亡赔案;1有责不涉及死亡赔案;2无责赔案;3垫付赔案;4垫付救助基金;9其它;）
  String get claimTypeStr {
    if (claimType == null || claimType.isEmpty) {
      claimType = "0";
    }
    switch (int.parse(claimType)) {
      case 0:
        return '有责涉及死亡赔案';
      case 1:
        return '有责不涉及死亡赔案';
      case 2:
        return '无责赔案';
      case 3:
        return '垫付赔案';
      case 4:
        return '垫付救助基金';
      default:
        return '其它';
    }
  }

  HisClaimDto(
      {this.accidentDeath,
      this.areaCode,
      this.claimType,
      this.endCaseTime,
      this.endDate,
      this.insurerArea,
      this.kindCode,
      this.lossFee,
      this.lossTime,
      this.payCompany,
      this.policyNo,
      this.startDate});

  HisClaimDto.fromJson(Map<String, dynamic> json) {
    accidentDeath = json['accidentDeath'];
    areaCode = json['areaCode'];
    claimType = json['claimType'];
    endCaseTime = json['endCaseTime'];
    endDate = json['endDate'];
    insurerArea = json['insurerArea'];
    kindCode = json['kindCode'];
    lossFee = json['lossFee'];
    lossTime = json['lossTime'];
    payCompany = json['payCompany'];
    policyNo = json['policyNo'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accidentDeath'] = this.accidentDeath;
    data['areaCode'] = this.areaCode;
    data['claimType'] = this.claimType;
    data['endCaseTime'] = this.endCaseTime;
    data['endDate'] = this.endDate;
    data['insurerArea'] = this.insurerArea;
    data['kindCode'] = this.kindCode;
    data['lossFee'] = this.lossFee;
    data['lossTime'] = this.lossTime;
    data['payCompany'] = this.payCompany;
    data['policyNo'] = this.policyNo;
    data['startDate'] = this.startDate;
    return data;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import 'RequestUtil.dart';

void main() {
//print(NetWork.instance);

  RequestUtil.sInstance.ships().then((onValue) {
    print("接口返回的数据是:onValue = $onValue");
  });

  String mUserName = "name";

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  prefs.then((onValue) {
    onValue.setString(mUserName, "小明");
  });

  SharedPreferences.getInstance().then((onValue) {
    print("onValue.getString(mUserName)=   ${onValue.getString(mUserName)}");
  });
}
//  prefs.setString(mUserName,"小明");

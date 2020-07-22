package com.ax.ax_flutter_demo;

import android.view.KeyEvent;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StringCodec;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

/*  @Override
  public boolean onKeyUp(int keyCode, KeyEvent event) {
    if (keyCode == KeyEvent.KEYCODE_BACK && event.getAction() == KeyEvent.ACTION_UP) {
      finish();
      overridePendingTransition(R.anim.no_animation, R.anim.push_bottom_out);
      //不执行父类点击事件
      return true;
    }
    //继续执行父类其他点击事件
    return super.onKeyUp(keyCode, event);
  }*/

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if ((keyCode == KeyEvent.KEYCODE_BACK)) {
            System.out.println("按下了back键   onKeyDown()");
            BasicMessageChannel mBasicMessageChannel = new BasicMessageChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), "Android_back", StringCodec.INSTANCE);
            mBasicMessageChannel.send("向flutter发送消息");
        }

        return super.onKeyDown(keyCode, event);

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        System.out.println("执行 onDestroy()");
    }
}

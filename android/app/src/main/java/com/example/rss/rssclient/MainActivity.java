package com.example.rss.rssclient;

import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "rssChannel";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
                if (methodCall.method == CHANNEL) {
//                    String x = methodCall.argument("name");
//                    Log.i("rssChannel", "onMethodCall: " + x);
                    rssChannel();
                    result.success("lorem Ipsum");
                }
            }
        };
    }

    public void rssChannel() {//String param) {
        Log.i("rssChannel", "onMethodCall: ");

    }
}

package com.example.flutter_users_group_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    // Define the channel for communication with Flutter
    private val CHANNEL = "appExitChannel"

    override fun onDestroy() {
        super.onDestroy()

        // Safely get the Flutter engine and use the method channel
        flutterEngine?.let {
            val channel = MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL)
            channel.invokeMethod("onAppExit", null)
        }
    }

    override fun onPause() {
        super.onPause()
        flutterEngine?.let {
            val channel = MethodChannel(it.dartExecutor.binaryMessenger, CHANNEL)
            channel.invokeMethod("onAppExit", null)
        }
    }
}

  import Flutter
  import UIKit

  @UIApplicationMain
  @objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    override func applicationWillTerminate(_ application: UIApplication) {
          // Notify Flutter that the app is being terminated
          let flutterEngine = (window?.rootViewController as? FlutterViewController)?.engine
          let channel = FlutterMethodChannel(name: "appExitChannel", binaryMessenger: flutterEngine!.binaryMessenger)
          channel.invokeMethod("onAppExit", arguments: nil)
      }
  }

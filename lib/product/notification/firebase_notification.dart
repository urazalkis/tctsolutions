import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotification{
  static FirebaseNotification? _instance;

  static FirebaseNotification? get instance => _instance ??= FirebaseNotification._init();

  FirebaseNotification._init();

  Future<void> notificationInit() async{
    FlutterLocalNotificationsPlugin flp = FlutterLocalNotificationsPlugin();
    initializationSettings(flp);
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showNotification(event.notification!.body,flp);
      print(event.data.values);

    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }
  Future<void> showNotification(String? content,FlutterLocalNotificationsPlugin flp) async{
    var androidBildirimDetay = AndroidNotificationDetails(
      "Kanal Id",
      "Kanal başlık",
      playSound: true,
      importance: Importance.high,
      priority: Priority.high,
    );

    var iosNotificationDetails = IOSNotificationDetails();

    var notificationDetails = NotificationDetails(android: androidBildirimDetay,iOS: iosNotificationDetails);

    await flp.show(0, null, content, notificationDetails,payload: "payload içerik");
  }
  Future<void> initializationSettings(FlutterLocalNotificationsPlugin flp) async{
    AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings("@mipmap/launcher_icon");
    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(android: androidInitializationSettings,iOS: iosInitializationSettings);

    await flp.initialize(initializationSettings,onSelectNotification: onSelectNotification);

  }
  Future<void> onSelectNotification(String? payload) async{

    if(payload != null)
    {
      print("bildirim secildi: $payload");
    }
  }
}
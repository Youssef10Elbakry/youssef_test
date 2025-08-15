import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
  final firebaseMessaging = FirebaseMessaging.instance;

  getFCM() async {
    await firebaseMessaging.requestPermission();
    final fcmToken =  await firebaseMessaging.getToken();
    print("#############################");
    print("FCM Token: $fcmToken");
    print("#############################");

    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      print("#############################");
      print("Notification when app is opened: ${message.notification!.title}");
      print("#############################");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print("#############################");
      print("Notification while app is notification is opened: ${message.notification!.title}");
      print("#############################");
    });
    
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message)async{
      print("#############################");
      print("Notification while app is on background: ${message.notification!.title}");
      print("#############################");
    });
  }
}
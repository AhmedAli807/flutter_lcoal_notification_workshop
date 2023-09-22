import 'package:flutter/material.dart';
import 'package:flutter_lcoal_notification_workshop/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService notificationService=NotificationService();
  @override
  void initState() {
    super.initState();
    notificationService.initializeNotification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            notificationService.sendNotification(title: 'Flutter', body: 'Hello');
          }, child: const Text('Send notification')),
         const  SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            notificationService.periodicNotification(title: 'Flutter', body: 'Hello');
          }, child: const Text('Periodic notification')),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            notificationService.cancelNotification;
          }, child: const Text('Cancel notification'))
        ],
      ),
    );
  }
}

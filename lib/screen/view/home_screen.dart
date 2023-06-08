import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification/utils/notification_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationServices.services.showSimpleNotification();
              },
              child: const Text("Simple Notification"),
            ),
            ElevatedButton(
              onPressed: () {
                NotificationServices.services.showSchedualeNotification();
              },
              child: const Text("Simple Notification"),
            ),
          ],
        ),
      ),
    );
  }
}

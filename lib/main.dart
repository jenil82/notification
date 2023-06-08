import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/screen/view/home_screen.dart';
import 'package:notification/utils/notification_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationServices.services.initNotification();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
      ],
    ),
  );
}

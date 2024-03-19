import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_reader_app/bindings/base_bindings.dart';
import 'package:qr_code_reader_app/db/boxes.dart';
import 'package:qr_code_reader_app/db/vcard.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/routes/getx_app_pages.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(VCardAdapter());
  vcardBox = await Hive.openBox<VCardHive>('vcardBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Code Reader App',
      initialBinding: BaseBindings(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

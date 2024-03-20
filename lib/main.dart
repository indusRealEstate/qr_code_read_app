import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/bindings/base_bindings.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/routes/getx_app_pages.dart';

Future<void> main() async {
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

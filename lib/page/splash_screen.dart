import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenViewController>(
        init: SplashScreenViewController(),
        builder: (controller) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset(
                    'assets/images/indus-logo.png',
                  ),
                ),
                Text(
                  'Indus Event QR Code Reader',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

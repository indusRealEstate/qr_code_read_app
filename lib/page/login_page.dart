import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[300],
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/indus-logo.png',
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          'Agent Login',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 3),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Obx(
                    () => Column(
                      children: <Widget>[
                        getErrorMessage(controller),
                        TextField(
                          controller: controller.usernameController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                  width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFd3ab33),
                                width: 0.5,
                              ),
                            ),
                            hintText: 'Username',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: controller.passwordController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 180, 180, 180),
                                  width: 0.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFd3ab33),
                                width: 0.5,
                              ),
                            ),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.login();
                            },
                            child: controller.loggingInLoading.value == true
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20.0),
                        //   child: InkWell(
                        //       onTap: () {},
                        //       child: const Text('Forgot Password?')),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getErrorMessage(LoginController controller) {
  if (controller.isUserDataIncorrect.value == true) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
        'User does not exist',
        style: TextStyle(color: Colors.red),
      ),
    );
  } else if (controller.isUserNotInsertData.value == true) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
        'Please enter data.',
        style: TextStyle(color: Colors.red),
      ),
    );
  } else {
    return const SizedBox(
      height: 36,
    );
  }
}

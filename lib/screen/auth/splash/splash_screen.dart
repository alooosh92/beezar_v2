import 'dart:async';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/home/primer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

double _size = 0;
AuthController _authController = Get.find();

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _authController.checkToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width / 1.1,
                    width: MediaQuery.sizeOf(context).width / 1.1,
                    child: Image.asset("lib/assets/images/logoo 1.png",
                        fit: BoxFit.fill),
                  ),
                  const Text("Developed by ©️ ARG Group Co.",
                      style: FontDef.w600S17Cb),
                ],
              ),
            );
          }
          Timer(const Duration(seconds: 3), () {
            if (_authController.checkUser!) {
              Get.offAll(const PrimerScreen());
            } else {
              Get.offAll(const LoginScreen());
            }
          });
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width / 1.1,
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  child: Image.asset("lib/assets/images/logoo 1.png",
                      fit: BoxFit.fill),
                ),
                const Text("Developed by ©️ ARG Group Co.",
                    style: FontDef.w600S17Cb),
              ],
            ),
          );
        },
      ),
    );
  }
}

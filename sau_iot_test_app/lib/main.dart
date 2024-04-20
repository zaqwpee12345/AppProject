import 'package:flutter/material.dart';
import 'package:sau_iot_test_app/newUI.dart';
import 'package:sau_iot_test_app/view/login_UI.dart';
import 'package:sau_iot_test_app/view/splash_screen_ui.dart';




void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreenUI(),
    ),
  );
}
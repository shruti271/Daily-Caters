import 'package:daily_caters/controller/signup/auth_controller.dart';
// import 'package:daily_caters/view/SignIn/SignIn.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  
final AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    
    // ignore: deprecated_member_use
    return MaterialApp(
      home: Scaffold(
        // ignore: deprecated_member_use
        body: FlatButton(onPressed: () async {          
          _authController.signOut();
          
        }, child: Center(child: Text("logout"))),
      ),
    );
  }
}
import 'package:daily_caters/controller/signup/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResertScreen extends StatelessWidget {
  // const ResertScreen({ Key? key }) : super(key: key);
TextEditingController email = TextEditingController();
 AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter your registered Email ID or User Name'),
                    ),
                  ),
                   TextButton(
                onPressed: () {
                  _authController
                      .sendpasswordresetemail(_authController.email.toString());
                },
                child: Text(
                  'send mail',
                  style: TextStyle(color: Color(0xff076800), fontSize: 13),
                ),
              ),
          ],
        ),
              
      ),
    );
  }
}
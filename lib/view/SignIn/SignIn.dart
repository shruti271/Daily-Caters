import 'package:daily_caters/controller/signup/auth_controller.dart';
import 'package:daily_caters/view/Signup/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ResertPassword.dart';

class SigninPage extends StatelessWidget {
  // const SigninPage({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(
                child: Image(
                  image: AssetImage('Assets/Images/dailycaterslogo.png'),
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: _authController.email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter your registered Email ID or User Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextField(
                  controller: _authController.password,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              TextButton(
                onPressed: () {
                  // _authController
                  //     .sendpasswordresetemail(_authController.email.toString());
                  Get.to(()=>ResertScreen());
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Color(0xff076800), fontSize: 13),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _authController.signIn();
                },
                child: Text('Sign In'),
                textColor: Color(0xffFFFFFF),
                color: Color(0xff076800),
                minWidth: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: 10,
              ),
              Text('Not registered yet ?'),
              MaterialButton(
                onPressed: () {
                  Get.to(() => SignupPage());
                  //SignupPage();
                },
                child: Text('Sign Up'),
                textColor: Color(0xffFFFFFF),
                color: Color(0xff076800),
                minWidth: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Login as a Guest User',
                  style: TextStyle(color: Color(0xff076800), fontSize: 15),
                ),
              ),
              // IconButton(onPressed: (){}, icon: Icon(Icons))
              // RawMaterialButton(
              //   onPressed: () {},
              //   elevation: 2.0,
              //   fillColor: Colors.white,
              //   child: Image.asset("Assets/Images/gogl.jpg",height: 15,),
              //   padding: EdgeInsets.all(15.0),
              //   shape: CircleBorder(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

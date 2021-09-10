import 'package:daily_caters/constants/firebase.dart';
import 'package:daily_caters/controller/signup/auth_controller.dart';
import 'package:daily_caters/view/Home/body.dart';
import 'package:daily_caters/view/SignIn/SignIn.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //await Firebase.initializeApp();  
  WidgetsFlutterBinding.ensureInitialized();
    await initialization.then((value){
    // Get.put(AppController());
    Get.put(AuthController());
  });

 await SharedPreferences.getInstance().then((value){
   var user;
   user = value.getString('UID_daily_caters');
  
  if(user!=null){
     final AuthController _authController = Get.find();
     _authController.initializeUserModel(user);
  }   
     runApp(MyApp(cuser:user));
   });
  
  
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);
  final AuthController authController = Get.find();
  final cuser;
  MyApp({this.cuser});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child:(cuser !=null )?
              HomeScreen():
             SigninPage(),          
      ),
    );
  }
}

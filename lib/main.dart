//import 'package:daily_caters/view/SignIn.dart';
import 'package:daily_caters/view/Signup/Country.dart';
import 'package:daily_caters/view/Signup/SignUp.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  //await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


// class MyAppSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Splash Screen',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyApp(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
//}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          
          // appBar: AppBar(
          //   title: Text('Daily Caters'),
          //   backgroundColor: Color(0xff076800),
          // ),
        body: CityDropDownBar(),
        
      ),
      ),
    );
  }
}

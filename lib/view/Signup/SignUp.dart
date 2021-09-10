// import 'package:daily_caters/view/Signup/Country.dart';
import 'package:daily_caters/controller/signup/auth_controller.dart';
import 'package:daily_caters/view/Signup/Country.dart';
// import 'package:daily_caters/view/Signup/image_picker_Signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  // const SignupPage({Key? key}) : super(key: key);
  // final AuthController _authController = Get.put(AuthController());
  final AuthController _authController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      //   appBar: new AppBar(actions: [
      //   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))
      // ],),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: IconButton(onPressed: (){
          Get.to(()=>CityDropDownBar());
          
        }, icon: Icon(Icons.arrow_forward,)),
        
        backgroundColor:Color(0xff076800),
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Title(
                        color: Color(0xff076800),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xff076800),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextField(
                        controller: _authController.name,                                        
                        onChanged: (val)=> _authController.userModel.value.name=val,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User Name',
                            hintText: 'Enter a User Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextField(
                        controller: _authController.email,
                        onChanged: (val)=> _authController.userModel.value.email=val,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email ID',
                            hintText: 'Enter your Email ID'),
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextField(
                        obscureText: true,                    
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                               borderSide: const BorderSide(color: Color(0xff076800), ),
                               
                            ),                        
                            // focusColor: Color(0xff076800),
                            // fillColor: Color(0xff076800),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Color(0xff076800)),
                            hintText: 'Enter your New Password'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextField(
                        controller: _authController.password,
                        onChanged: (val)=> _authController.userModel.value.password=val,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Re-type Password',
                            hintText: 'Re-type your New Password'),
                      ),
                    ),
      
                    // Container(
                    //  // width: MediaQuery.of(context).size.width * 0.7,
                    //   //margin: EdgeInsets.only(left: 10, right: 10),
                    //   child: CityDropDownBar()),
                    SizedBox(
                      height: 30,
                    ),
                    // ImagePickerForCategory(),
                    // MaterialButton(
                    //   onPressed: () {},
                    //   child: Text('Next'),
                    //   textColor: Color(0xffFFFFFF),
                    //   color: Color(0xff076800),
                    //   minWidth: MediaQuery.of(context).size.width * 0.50,
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    // ),
                  ],
                ),
              ),
            ),
          
        ),
      ),
    
    );
  }
}

// import 'package:daily_caters/view/Signup/Country.dart';
import 'dart:ui';

import 'package:daily_caters/controller/signup/auth_controller.dart';
// import 'package:daily_caters/helpers/form_prefix_icon.dart';
import 'package:daily_caters/view/Signup/Country.dart';
// import 'package:daily_caters/view/Signup/image_picker_Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final bool _autoValidate = false;
  //  bool _obscureText = true;
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          //   appBar: new AppBar(actions: [
          //   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back))
          // ],),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: IconButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print("success");
                    Get.to(() => CityDropDownBar());
                  } else
                    print("ohhhkkkk error ");
                },
                icon: Icon(
                  Icons.arrow_forward,
                )),
            backgroundColor: Color(0xff076800),
          ),
          body: GetBuilder<AuthController>(
              // init: Get.put<AuthController>(AuthController()),
              builder: (authControll) {
            return SizedBox(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Form(
                        key: _formKey,
                        // ignore: deprecated_member_use
                        autovalidate: true,
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
                              child: TextFormField(
                                controller: _authController.name,
                                keyboardType: TextInputType.emailAddress,
                                //             decoration: InputDecoration(
                                //   labelText: "First Name",
                                //   hintText: "Enter your first name",
                                //   floatingLabelBehavior: FloatingLabelBehavior.always,
                                //   suffixIcon: CustomSurffixIcon(svgIcon: "Assets/form_icon/User.svg"),
                                // ),
                                validator: (String value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter First Name';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Please Enter First Name';
                                  } else {
                                    _authController.userModel.value.name = val;
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(                                      
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                      
                                        color: Color(0xff076800), width: 20),
                                  ),
                                  labelText: 'User Name',
                                  hintText: 'Enter a User Name',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  suffixIcon: Icon(
                                    Icons.account_box,
                                    color: Colors.green,
                                  ),
                                  // suffixIcon: SvgPicture.asset("Assets/form_icon/User.svg",),
                                  // CustomSurffixIcon(
                                  //     svgIcon: "Assets/form_icon/User.svg"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: TextFormField(
                                controller: _authController.email,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  if (value.length == 0)
                                    return "Please Enter Email";
                                  else if (!value.isEmail)
                                    return "Please Enter valid Email";
                                  else
                                    return null;
                                },
                                validator: (String value) {
                                  if (value.isEmail) {
                                    print("yes");
                                  }
                                  if (value.length == 0)
                                    return "Please Enter Email";
                                  else if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  // else if (!value.contains("@"))
                                  //   return "Please Enter valid Email \nEmail contain @gmail.com or @yahoo.com";
                                  else
                                    return null;
                                },
                                // onChanged: (val) {
                                //   if (val.length == 0)
                                //     return "Please Enter Email";
                                //   else if (!RegExp(r'\S+@\S+\.\S+')
                                //       .hasMatch(val)) {
                                //     return 'Please enter a valid email address';
                                //   }
                                //   // _authController.userModel.value.email = val;
                                // },

                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.yellow, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  labelText: 'Email ID',
                                  hintText: 'Enter your Email ID',
                                  suffixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: TextFormField(
                                controller: _authController.password,
                                obscureText:
                                    _authController.obscurepasswordText.value,
                                onChanged: (value) {
                                  // if (!RegExp(
                                  //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                  //     .hasMatch(value)) {
                                  //   return "enter corrct";
                                  // }
                                  if (value.length == 0)
                                    return "Please Enter password";
                                  else if (value.length >= 12)
                                    return "Password should be less then 12 char long";
                                  else if (value.length <= 6)
                                    return "Password should be more then 6 char long";
                                  else
                                    return null;
                                },
                                validator: (value) {return null;
                                  // //                   String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                  // // RegExp regExp = new RegExp(pattern);
                                  // // return regExp.hasMatch(value);
                                  // // if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                                  // // if (!RegExp(
                                  // //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$')
                                  // //     .hasMatch(value)) {
                                  // //   return "enter corrct";
                                  // // }
                                  // if (value.length == 0)
                                  //   return "Please Enter password";
                                  // else if (value.length >= 12)
                                  //   return "Password should be less then 12 char long";
                                  // else if (value.length <= 6)
                                  //   return "Password should be more then 6 char long";
                                  // else
                                  //   return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff076800),
                                      ),
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        _authController.getpasswordvisibility(
                                            !_authController
                                                .obscurepasswordText.value);
                                        // _authController.obscureText.value =!(_authController.obscureText.value) ;
                                        print("clicked" +
                                            _authController
                                                .obscurepasswordText.value
                                                .toString());
                                        // });
                                      },
                                      child: Icon(
                                        _authController
                                                .obscurepasswordText.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        semanticLabel: _authController
                                                .obscurepasswordText.value
                                            ? 'show password'
                                            : 'hide password',
                                      ),
                                    ),
                                    // focusColor: Color(0xff076800),
                                    // fillColor: Color(0xff076800),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: Color(0xff076800)),
                                    hintText: 'Enter your New Password'),
                              ),
                            ),
                            FlutterPwValidator(
                                controller: _authController.password,
                                minLength: 6,
                                uppercaseCharCount: 2,
                                numericCharCount: 3,
                                specialCharCount: 1,
                                width: 400,
                                height: 150,
                                onSuccess: () {}),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: TextFormField(
                                controller: _authController.comfirmpassword,
                                onChanged: (val) {
                                  if(val==null)return " enter password";
                                   else if (val !=_authController.userModel.value.password)
                                    return "Confirm password must match with password";
                                  //  _authController
                                  //   .userModel.value.password = val;
                                  return null;
                                    },
                                validator: (String value) {
                                  if (value.length == 0)
                                    return "Please Enter  Confirm password";
                                  // else if (value.length >= 12)
                                  //   return "Password should be less then 12 char long";
                                  // else if (value.length <= 6)
                                  //   return "Password should be more then 6 char long";
                                  // else 
                                  else if (value !=
                                      _authController.userModel.value.password)
                                    return "Confirm password must match with password";
                                  else
                                    return null;
                                },
                                obscureText: _authController
                                    .obscureconfirmpasswordText.value,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        // setState(() {
                                        _authController.getpasswordvisibility(
                                            !_authController
                                                .obscureconfirmpasswordText
                                                .value);
                                        // _authController.obscureText.value =!(_authController.obscureText.value) ;
                                        print("clicked" +
                                            _authController
                                                .obscureconfirmpasswordText
                                                .value
                                                .toString());
                                        // });
                                      },
                                      child: Icon(
                                        _authController
                                                .obscureconfirmpasswordText
                                                .value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        semanticLabel: _authController
                                                .obscureconfirmpasswordText
                                                .value
                                            ? 'show password'
                                            : 'hide password',
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    labelText: 'Confirm Password',
                                    hintText: 'Re-type your New Password'),
                              ),
                            ),
                            
                            SizedBox(
                              height: 30,
                            ),
                            // ImagePickerForCategory(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}

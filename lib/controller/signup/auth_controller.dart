import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_caters/constants/firebase.dart';
import 'package:daily_caters/helpers/showLoading.dart';
import 'package:daily_caters/models/user.dart';
import 'package:daily_caters/view/Home/body.dart';
import 'package:daily_caters/view/SignIn/SignIn.dart';
import 'package:daily_caters/view/Signup/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User>? firebaseUser;
  // RxBool isLoggedIn = false.obs;
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final List<String> locations = ['Australia', 'Canada', 'New Zealand'];
  final List<String> _ausstate = [
    'NSW',
    'ACT',
    'WA',
    'NT',
    'SA',
    'QLD',
    'VIC',
    'TAS'
  ];
  final List<String> _canadastate = [
    'Alberta',
    'British Columbia',
    'Manitoba',
    'New Brunswick',
    'Newfoundland and Labrador',
    'Northwest Territories',
    'Nova Scotia',
    'Nunavut',
    'Ontario',
    'Prince Edward Island',
    'Quebec',
    'Saskatchewan',
    'Yukon'
  ];
  final List<String> _nzstate = [
    'Northland',
    'Auckland',
    'Waikato',
    'Bay of Plenty',
    'Gisborne',
    'Hawke\'s Bay',
    'Taranaki',
    'Manawatu-Whanhanui',
    'Wellington',
    'Tasman',
    'Nelson',
    'Marlborough',
    'West Coast',
    'Canterbury',
    'Otago',
    'Southland'
  ];

  List<String> curstate = [''].obs;
  var curUser;
  var selecetedstate = ''.obs;

  Rx<UserModel> userModel = UserModel().obs;

  

  void getselectCountry(String val) {
    userModel.value.selectedcountry = val;
    if (userModel.value.selectedstate != null) {
      userModel.value.selectedstate = null;
    }
    print(userModel.value.selectedcountry);
    if (val == locations[0])
      curstate = _ausstate;
    else if (val == locations[1])
      curstate = _canadastate;
    else if (val == locations[2]) curstate = _nzstate;
    update();
  }

  void getselectSate(String val) {
    // selectedLocation = value;
    userModel.value.selectedstate = val;
    update();
    print(userModel.value.selectedstate);
  }

  void setName(String name) {
    userModel.value.name = name;
  }

  @override
  void onReady() {
    super.onReady();
    // firebaseUser = Rx<User>(auth.currentUser!);
    // firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser!, _setInitialScreen);
  }

  // _setInitialScreen(User user) {
  //   // ignore: unnecessary_null_comparison
  //   if (user == null) {
  //     // Get.offAll(() => AuthenticationScreen());
  //   } else {
  //     // Get.offAll(() => HomeScreen());
  //   }
  // }
  @override
  void onClose() {
    userModel.close();
    super.onClose();
  }

  // Future<bool> getRememberUser()  async {
  //     await SharedPreferences.getInstance().then((value) {
  //      var user = value.getString('UID_daily_caters');
  //      print(user);
  //      print("???????????????????");
  //      if(user!=null)
  //      {
  //        _initializeUserModel(user);
  //        curUser=true;
  //      }else
  //      curUser=false;

  //   });
  //   return true;
  // }

  Future<void> _rememberUser(String curuser) async {
    await SharedPreferences.getInstance().then((value) {
      value.setString("UID_daily_caters", curuser);
    });
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        initializeUserModel(_userId);
        print(_userId);
        _rememberUser(_userId);
        _clearControllers();
        dismissLoadingWidget();
        Get.off(() => HomeScreen());
      });
    } catch (e) {
      debugPrint(e.toString());
      dismissLoadingWidget();
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    showLoading();
    try {
      print(userModel.value.email);
      print(userModel.value.password);
      if(auth.isSignInWithEmailLink("https://dailycaters-a8a89.firebaseapp.com/__/auth/action?mode=action&oobCode=code"))
      {
        await auth.signInWithEmailLink(email: userModel.value.email ?? "", emailLink: "https://dailycaters-a8a89.firebaseapp.com/__/auth/action?mode=action&oobCode=code").then((value) {
        print("ohhhhhhhkkkkkkkkkkkkkkjiiiiiii");
      }) ;}
       await auth
          .createUserWithEmailAndPassword(
              email: userModel.value.email ?? "",
              password: userModel.value.password ?? "")
          .then((result) {
            
        // print(result);
        // print("????????????????");
        String _userId = result.user!.uid;
        
        _addUserToFirestore(_userId);
        _rememberUser(userModel.value.id.toString());
        initializeUserModel(_userId);
        _clearControllers();
      });
      
      // user.s;
      // print("??????????????????????????");
      // print(userModel.value.name);
      // print(userModel.value.selectedcountry);
      // print(userModel.value.selectedstate);
      // print("??????????????????????????");
    } catch (e) {
      debugPrint(e.toString());
      dismissLoadingWidget();
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    auth.signOut();
    userModel.close();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print("cliecked..");
    Get.off(() => SigninPage());
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection("Users").doc(userId).set({
      // "id": userId,
      "UserName": userModel.value.name,
      "password": userModel.value.password,
      "email": userModel.value.email,
      "country": userModel.value.selectedcountry,
      "state": userModel.value.selectedstate
    });
    _rememberUser(userModel.value.id.toString());
    dismissLoadingWidget();
  }

  void sendpasswordresetemail(String email) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(() => SignupPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError((onError) {
      Get.snackbar("Error In Email Reset", onError.message);
    });
  }

// void google_signIn() async{

//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//       idToken: googleAuth.idToken,
//       accessToken: googleAuth.accessToken
//     );

//     final User user = (await auth.signInWithCredential(credential).then((value) => Get.offAll(SigninPage())));
//  }

//  void google_signOut() async{
//     await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
//  }

//   Future<Null> fb_login() async {
//     final FacebookLoginResult result =
//     await facebookSignIn.logIn(['email']);

//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final FacebookAccessToken accessToken = result.accessToken;
//         print('''
//          Logged in!

//          Token: ${accessToken.token}
//          User id: ${accessToken.userId}
//          Expires: ${accessToken.expires}
//          Permissions: ${accessToken.permissions}
//          Declined permissions: ${accessToken.declinedPermissions}
//          ''');
//         break;
//       case FacebookLoginStatus.cancelledByUser:
//         print('Login cancelled by the user.');
//         break;
//       case FacebookLoginStatus.error:
//         print('Something went wrong with the login process.\n'
//             'Here\'s the error Facebook gave us: ${result.errorMessage}');
//         break;
//     }
//   }

  initializeUserModel(String userId) async {
    userModel.value = await FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
        .get()
        .then((DocumentSnapshot doc) => UserModel.fromSnapshot(doc));

    dismissLoadingWidget();
    print("ooooooooooohhhhhhkkkkkkk");
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}

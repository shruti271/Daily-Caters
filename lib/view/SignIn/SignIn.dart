import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email or User Name',
                    hintText: 'Enter your registered Email ID or User Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your Password'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Color(0xff076800), fontSize: 13),
              ),
    
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            ),
            MaterialButton(
              onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/components/button.dart';
import 'package:testapp/components/square.dart';

import 'package:testapp/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  //text editing controllers
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            //logo
            const SizedBox(height: 50),
            Icon(
              Icons.track_changes,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 50),
            Text(
              "CAREER COMPASS",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),

            const SizedBox(height: 25),
            //username
            Textfield(
              controller: emailcontroller,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 10),
            Textfield(
              controller: passwordcontroller,
              hintText: 'Password',
              obscureText: true,
            ),
            //password

            //forgot password?

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "forgot password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Buttonapp(
              onTap: signUserIn,
            ),

//divider
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 0.5,
                    color: Colors.white,
                  )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('Or continue with',
                  style: TextStyle(color: Colors.white)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Squarefile(
                    imagePath:
                        '/home/frabduraheem/projects/testapp/lib/images/6929234_google_logo_icon.png'),
                const SizedBox(
                  width: 10,
                ),
                Squarefile(
                    imagePath:
                        '/home/frabduraheem/projects/testapp/lib/images/images.png'),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "register now!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:testapp/components/button.dart';
import 'package:testapp/components/square.dart';
import 'package:testapp/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/pages/forgot.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/signup.dart';
import 'package:testapp/pages/holland_description.dart'; // ✅ Import Holland Description Page

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Text editing controllers
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // Function to sign in the user
  Future<void> signUserIn(context) async {
    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      // ✅ Navigate to HollandDescriptionPage first, before HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HollandDescriptionPage()),
      );

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message ?? "Login failed"),
          duration: Duration(seconds: 5),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Icon(Icons.track_changes, size: 100, color: Colors.white),
              const SizedBox(height: 50),
              Text(
                "CAREER COMPASS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 25),
              // Email Text Field
              Textfield(
                controller: emailcontroller,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),
              // Password Text Field
              Textfield(
                controller: passwordcontroller,
                hintText: 'Password',
                obscureText: true,
              ),

              // Forgot Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await resetPassword(context, emailcontroller.text);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Sign-in Button
              ElevatedButton(
                onPressed: () async {
                  await signUserIn(context);
                },
                child: Text("Sign in"),
              ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.5, color: Colors.white),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Or continue with',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Squarefile(imagePath: 'assets/images/google_logo.png'),
                  const SizedBox(width: 10),
                  Squarefile(imagePath: 'assets/images/facebook_logo.png'),
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
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Signup Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

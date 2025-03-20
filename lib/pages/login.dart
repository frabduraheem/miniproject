import 'package:flutter/material.dart';
import 'package:testapp/components/button.dart';
import 'package:testapp/components/square.dart';
import 'package:testapp/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/pages/forgot.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/signup.dart';
<<<<<<< HEAD
import 'package:testapp/pages/holland_description.dart'; // ✅ Import Holland Description Page
=======
import 'package:lottie/lottie.dart';
>>>>>>> f3475e62e5c7457e2cd32a335c6014d9abddc11e

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
<<<<<<< HEAD
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
=======
      backgroundColor: const Color.fromARGB(255, 159, 181, 214),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.network(
                'https://lottie.host/a55eb0cb-067c-4b41-8fde-fc153f64bb12/MZroI7nPV2.json', // NEW URL
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Center(
                  child: Column(
                children: [
                  const SizedBox(height: 330),
                  Text(
                    "CAREER COMPASS",
                    style: TextStyle(
                      color: const Color.fromARGB(108, 35, 70, 150),
                      fontSize: 30,
                      fontFamily: 'San Francisco',
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),
                  //username
                  Textfield(
                    controller: emailcontroller,
                    hintText: 'Email',
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
                        GestureDetector(
                          onTap: () async {
                            await resetPassword(context, emailcontroller.text);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  // Buttonapp(
                  //   onTap: signUserIn,
                  // ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                      ),
                      onPressed: () async {
                        await signUserIn(context);
                      },
                      child: Text(
                        "Sign in",
                      )),
//divider
                  const SizedBox(
                    height: 10,
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

                  /*   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or continue with',
                        style: TextStyle(color: Colors.white)),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Squarefile(imagePath: 'lib/images/google.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Squarefile(imagePath: '/lib/images/mac.png'),
                    ],
                  ),*/

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
                        GestureDetector(
                          onTap: () {
                            // Navigate to the signup page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpPage()), // Replace with your actual SignUpPage widget
                            );
                          },
                          child: Text(
                            "Register Now!",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
>>>>>>> f3475e62e5c7457e2cd32a335c6014d9abddc11e
        ),
      ),
    );
  }
}

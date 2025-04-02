import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/auth_services.dart';
import 'package:testapp/pages/forgot.dart';
import 'package:testapp/pages/signup.dart';
import 'package:testapp/client.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUserIn() async {
    try {
      UserCredential userCredential = await authService.signUserIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = userCredential.user;

      if (user != null) {
        if (!user.emailVerified) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text("Email Not Verified"),
                  content: const Text(
                    "Please verify your email before logging in.",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await authService.resendVerificationEmail();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Verification email resent! Check your inbox.",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text("Resend Email"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
          );
        } else {
          hasSavedDataInServer(context);
        }
      } else {
        print("Error connectiong to login server");
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message ?? "Login failed"),
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 181, 214),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Animation
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.network(
                'https://lottie.host/a55eb0cb-067c-4b41-8fde-fc153f64bb12/MZroI7nPV2.json',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 340), // Moved downward slightly
                    // App Title with Darker Shade
                    Text(
                      "CAREER COMPASS",
                      style: TextStyle(
                        color: const Color.fromARGB(
                          255,
                          25,
                          50,
                          120,
                        ), // Darker blue shade
                        fontSize: 28, // Slightly reduced font size
                        fontFamily: 'San Francisco',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 50), // Added space
                    // Email Box (Smaller & Lower)
                    Container(
                      width: 280, // Decreased size
                      padding: const EdgeInsets.all(12), // Reduced padding
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12), // Moved downward slightly
                    // Password Box (Smaller & Lower)
                    Container(
                      width: 280, // Decreased size
                      padding: const EdgeInsets.all(12), // Reduced padding
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 10,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: GestureDetector(
                          onTap: () async {
                            await resetPassword(context, emailController.text);
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sign In Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        await signUserIn();
                      },
                      child: const Text("Sign in"),
                    ),

                    const SizedBox(height: 20),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Register Now!",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

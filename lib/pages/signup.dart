import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/auth_services.dart'; // ✅ Ensure this import is correct
import 'package:testapp/components/textfield.dart';
import 'package:testapp/pages/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> signUpUser() async {
    try {
      UserCredential userCredential = await authService.signUpUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Send verification email
      await userCredential.user?.sendEmailVerification();

      // Store user details in Firestore
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': nameController.text.trim(),
          'dob': dobController.text.trim(),
          'email': emailController.text.trim(),
          'uid': user.uid,
        });
      }

      // Show verification message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Verification email sent. Please check your inbox."),
          duration: Duration(seconds: 5),
        ),
      );

      // Navigate to Login Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 181, 214),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.person_add, size: 100, color: Colors.white),
                const SizedBox(height: 50),
                const Text(
                  "CREATE ACCOUNT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 25),
                Textfield(controller: nameController, hintText: 'Full Name', obscureText: false),
                const SizedBox(height: 10),
                Textfield(controller: dobController, hintText: 'Date of Birth (DD/MM/YYYY)', obscureText: false),
                const SizedBox(height: 10),
                Textfield(controller: emailController, hintText: 'Email', obscureText: false),
                const SizedBox(height: 10),
                Textfield(controller: passwordController, hintText: 'Password', obscureText: true),
                const SizedBox(height: 25),

                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                  ),
                  onPressed: signUpUser,
                  child: const Text("Sign Up"),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?", style: TextStyle(color: Colors.white)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                      child: const Text("Login now!", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

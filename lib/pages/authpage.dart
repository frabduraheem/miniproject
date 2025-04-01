import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // ✅ If user is logged in, go to HomePage
        if (snapshot.hasData) {
          return HomePage();
        }
        // ❌ Otherwise, show LoginPage
        else {
          return LoginPage();
        }
      },
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if (snapshot.hasData) {
            return HomePage(); //if user is logged in
            // } else {
            // return LoginPage(); //not case
            // }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> resetPassword(BuildContext context, String email) async {
  if (email.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please enter your email"),
        duration: Duration(seconds: 5),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
    return;
  }

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text("Password reset email sent! Check your inbox."),
        duration: Duration(seconds: 5),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(e.message!),
        duration: Duration(seconds: 5),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

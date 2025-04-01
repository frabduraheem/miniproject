import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // ✅ Import FirebaseAuth
import 'package:testapp/auth_services.dart';
import 'package:testapp/pages/app_loading_pages.dart';
import 'package:testapp/pages/login.dart';
import 'package:testapp/widgets/lottie_splash.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.authStateChanges, // ✅ Listen to FirebaseAuth changes
      builder: (context, AsyncSnapshot<User?> snapshot) {
        Widget widget;

        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = const AppLoadingPage();
        } else if (snapshot.hasData) {
          // Show animation first before navigating
          widget =  LottieSplashScreen();
        } else {
          widget = pageIfNotConnected ?? const LoginPage();
        }

        return widget;
      },
    );
  }
}

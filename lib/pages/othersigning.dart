import 'package:flutter/material.dart';
import 'package:testapp/pages/home_page.dart';

// Sample SignIn Pages for Google and Apple
class GoogleSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google Sign In")),
      body: Center(
        child: Text("Sign in using Google here"),
      ),
    );
  }
}

class AppleSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Apple Sign In")),
      body: Center(
        child: Text("Sign in using Apple here"),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to Google Sign-In Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleSignInPage()),
                );
              },
              child: Image.asset('assets/google_icon.png',
                  width: 50, height: 50), // Google Icon
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                // Navigate to Apple Sign-In Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppleSignInPage()),
                );
              },
              child: Image.asset('assets/apple_icon.png',
                  width: 50, height: 50), // Apple Icon
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

import 'package:flutter/material.dart';
import 'package:testapp/firebase_options.dart';
import 'package:testapp/pages/authpage.dart';
import 'package:testapp/pages/login.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authpage(),
    );
  }
}

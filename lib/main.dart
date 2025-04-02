import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testapp/firebase_options.dart';
import 'package:testapp/pages/authpage.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login.dart';
import 'package:testapp/pages/signup.dart';
import 'package:testapp/pages/holland_description.dart';
import 'package:testapp/widgets/lottie_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // ✅ Show splash screen first
      initialRoute: '/',
      routes: {
        '/': (context) => LottieSplashScreen(), // Show animation first
        '/holland':
            (context) =>
                HollandDescriptionPage(), // ✅ Holland screen after splash
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/auth': (context) => AuthPage(),
      },
    );
  }
}

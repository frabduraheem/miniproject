import 'package:flutter/material.dart';
import 'package:testapp/firebase_options.dart';
import 'package:testapp/pages/authpage.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/login.dart';
import 'package:testapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Authpage(),
  //   );
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      // routes: {
      //   '/profile': (context) => const Profilescreen(),
      //   '/report': (context) => const ReportScreen(),
      //   '/viewreport': (context) => ReportsListScreen(),
      //   '/events': (context) => const EventsScreen(),
      //   '/saved': (context) => const SavedPostsScreen(),
      //   '/notification': (context) => const NotificationScreen(),
      //   '/rehab': (context) => Rehabscreen(),
      //   '/progress': (context) => const ProgressScreen(),
      //   '/care': (context) => Carescreen(),
      //   '/settings': (context) => const SettingsPage(),
      //   // ... existing routes
      // },
      // home: const WelcomeScreen(),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapsot) {
            if (snapsot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapsot.data != null) {
              return HomePage();
            }
            return LoginPage();
          }),
    );
  }
}

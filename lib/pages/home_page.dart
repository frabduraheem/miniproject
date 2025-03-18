import 'package:flutter/material.dart';
import 'package:testapp/widgets/lottie_background.dart';
import 'package:testapp/pages/questions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // ✅ Centers vertically
        children: [
          // ✅ Lottie Animation (Fixed Size)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
            width: MediaQuery.of(context).size.width, // Full width
            child: const LottieBackground(animationPath: 'assets/animations/customer_support.json'),
          ),

          const SizedBox(height: 20), // ✅ Space between animation & button

          // ✅ Start Quiz Button (Placed Exactly Below)
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()), // ❌ Removed `const`
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 8, 90, 158),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Start Quiz",
              style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

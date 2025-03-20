import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieBackground extends StatelessWidget {
  final String animationPath;

  const LottieBackground({
    Key? key,
    required this.animationPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Center(
        child: Lottie.asset(
          animationPath,
          width: MediaQuery.of(context).size.width,  // ✅ 80% of screen width
          height: MediaQuery.of(context).size.height, // ✅ 50% of screen height
          fit: BoxFit.contain,  // ✅ Adjusts animation to fit inside the box
        ),
      ),
    );
  }
}

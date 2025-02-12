import 'package:flutter/material.dart';

class Buttonapp extends StatelessWidget {
  final Function()? onTap;
  const Buttonapp({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Color.fromARGB(255, 7, 75, 114),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ));
  }
}

import 'package:http/http.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/pages/holland_description.dart';
import 'package:testapp/pages/home_page.dart';
import 'package:testapp/pages/questions.dart';
import 'package:testapp/pages/result.dart';

Future<Response> fetchRecommendedJobs(List<int?> answers) async {
  final url = Uri.parse(
    'https://miniproject-backend-production.up.railway.app/job_finder',
  );
  User? user = FirebaseAuth.instance.currentUser;
  String? uid = user?.uid; // Returns null if no user is logged in
  final Response response = await post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'uid': uid, 'answers': answers}),
  );
  return response;
}

hasSavedDataInServer(context) async {
  try {
    final url = Uri.parse(
      'https://miniproject-backend-production.up.railway.app/data_retriever',
    );
    User? user = FirebaseAuth.instance.currentUser;
    String? uid = user?.uid; // Returns null if no user is logged in
    final response = await post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'uid': uid}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data["flag"]) {
        Future.delayed(Duration.zero, () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HollandDescriptionPage(),
            ),
            (route) => false,
          );
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const HomePage()));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (context) =>
                      QuizScreen(answers: List<int>.from(data['answers'])),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ResultPage(data: data)),
          );
        });
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HollandDescriptionPage(),
          ),
        );
      }
    } else {
      print("Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    print("Error connecting to data server");
  }
}

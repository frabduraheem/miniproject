import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testapp/pages/login.dart';

class ResultPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const ResultPage({Key? key, required this.data}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> recommendedJobs = [];
  List<String> links = [];
  List<int> riasecScores = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    recommendedJobs = List<String>.from(widget.data['jobs']);
    links = List<String>.from(widget.data['links']);
    riasecScores = List<int>.from(widget.data['riasec']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Career Guidance Result",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Congratulations!", // ✅ Removed username
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Your RIASEC Assessment Scores:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            _buildScoresSection(),
            SizedBox(height: 20),
            Text(
              "Recommended Tech Jobs:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            _buildJobRecommendations(),
            Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Try Again"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text("Sign Out"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> riasecDomains = [
    "Realistic",
    "Investigative",
    "Artistic",
    "Social",
    "Enterprising",
    "Conventional",
  ];

  Widget _buildScoresSection() {
    return Column(
      children: List.generate(riasecScores.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${riasecDomains[index]}:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                riasecScores[index].toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildJobRecommendations() {
    return Column(
      children:
          List.generate(recommendedJobs.length, (index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(
                  recommendedJobs[index],
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () async {
                  final Uri url = Uri.parse(links[index]);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    print("Couldn't launch");
                  }
                },
              ),
            );
          }).toList(),
    );
  }
}

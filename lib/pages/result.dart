import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/client/conf.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:testapp/client/client.dart';

class ResultPage extends StatefulWidget {
  final String userName;
  final List<int> riasecScores;

  const ResultPage({
    Key? key,
    required this.userName,
    required this.riasecScores,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> recommendedJobs = [];
  List<String> links = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecommendedJobs();
  }

  Future<void> fetchRecommendedJobs() async {
    final url =
        Uri.parse('${AppConfig.url}'); // Correct API URL from config.dart
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'riasecscore': widget.riasecScores}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          recommendedJobs = List<String>.from(data['jobs']);
          links = List<String>.from(data['links']);
          //dont forget to delete print
          print(links);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Failed to connect to server: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Career Guidance Result",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Congratulations, ${widget.userName}!",
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
            isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildJobRecommendations(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Try Again"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
    "Conventional"
  ];
  Widget _buildScoresSection() {
    return Column(
      children: List.generate(widget.riasecScores.length, (index) {
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
                widget.riasecScores[index].toString(),
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
      children: List.generate(recommendedJobs.length, (index) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
              title:
                  Text(recommendedJobs[index], style: TextStyle(fontSize: 16)),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final Uri url = Uri.parse(links[index]);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  //replace with appropriate gui and remove print
                  print("couldn't launch");
                }
              }),
        );
      }).toList(),
    );
  }
}

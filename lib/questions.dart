import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // Sample questions
  final List<String> questions = [
    "Test the quality of parts before shipment",
    "Lay brick or tile",
    "Work on an offshore oil-drilling rig",
    "Assemble electronic parts",
    "Operate a grinding machine in a factory",
    "Fix a broken faucet",
    "Assemble products in a factory",
    "Install flooring in houses",
    "Study the structure of the human body",
    "Study animal behavior",
    "Do research on plants or animals",
    "Develop a new medical treatment or procedure",
    "Conduct biological research",
    "Study whales and other types of marine life",
    "Work in a biology lab",
    "Make a map of the bottom of an ocean",
    "Conduct a musical choir",
    "Direct a play",
    "Design artwork for magazines",
    "Write a song",
    "Write books or plays",
    "Play a musical instrument",
    "Perform stunts for a movie or television show",
    "Design sets for plays",
    "Give career guidance to people",
    "Do volunteer work at a non-profit organization",
    "Help people who have problems with drugs or alcohol",
    "Teach an individual an exercise routine",
    "Help people with family-related problems",
    "Supervise the activities of children at a camp",
    "Teach children how to read",
    "Help elderly people with their daily activities",
    "Sell restaurant franchises to individuals",
    "Sell merchandise at a department store",
    "Manage the operations of a hotel",
    "Operate a beauty salon or barber shop",
    "Manage a department within a large company",
    "Manage a clothing store",
    "Sell houses",
    "Run a toy store",
    "Generate the monthly payroll checks for an office",
    "Inventory supplies using a hand-held computer",
    "Use a computer program to generate customer bills",
    "Maintain employee records",
    "Compute and record statistical and other numerical data",
    "Operate a calculator",
    "Handle customers' bank transactions",
    "Keep shipping and receiving records"
  ];

  // Response options
  final List<String> options = [
    "Strongly Disagree",
    "Disagree",
    "Neutral",
    "Agree",
    "Strongly Agree"
  ];

  // Store selected answers
  Map<int, int?> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questionnaire!",
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    questions[index],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: List.generate(options.length, (optionIndex) {
                    return RadioListTile<int>(
                      title: Text(options[optionIndex]),
                      value: optionIndex,
                      groupValue: selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[index] = value;
                        });
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        backgroundColor: Colors.black,
        onPressed: () {
          print("Selected Answers: $selectedAnswers");
        },
      ),
    );
  }
}

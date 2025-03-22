import 'package:flutter/material.dart';
//import 'package:testapp/client/client.dart';
import 'package:testapp/pages/result.dart';



class IndexedMap {
  late String text;
  late int value;

  IndexedMap(String text, int value) {
    this.text = text;
    this.value = value;
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<IndexedMap> questions = [
    //(Question,id) where tens place of id denotes the riasec domain and ones place the question
    IndexedMap("Test the quality of parts before shipment", 00),
    IndexedMap("Lay brick or tile", 01),
    IndexedMap("Work on an offshore oil-drilling rig", 02),
    IndexedMap("Assemble electronic parts", 03),
    IndexedMap("Operate a grinding machine in a factory", 04),
    IndexedMap("Fix a broken faucet", 05),
    IndexedMap("Assemble products in a factory", 06),
    IndexedMap("Install flooring in houses", 07),
    IndexedMap("Study the structure of the human body", 10),
    IndexedMap("Study animal behavior", 11),
    IndexedMap("Do research on plants or animals", 12),
    IndexedMap("Develop a new medical treatment or procedure", 13),
    IndexedMap("Conduct biological research", 14),
    IndexedMap("Study whales and other types of marine life", 15),
    IndexedMap("Work in a biology lab", 16),
    IndexedMap("Make a map of the bottom of an ocean", 17),
    IndexedMap("Conduct a musical choir", 20),
    IndexedMap("Direct a play", 21),
    IndexedMap("Design artwork for magazines", 22),
    IndexedMap("Write a song", 23),
    IndexedMap("Write books or plays", 24),
    IndexedMap("Play a musical instrument", 25),
    IndexedMap("Perform stunts for a movie or television show", 26),
    IndexedMap("Design sets for plays", 27),
    IndexedMap("Give career guidance to people", 30),
    IndexedMap("Do volunteer work at a non-profit organization", 31),
    IndexedMap("Help people who have problems with drugs or alcohol", 32),
    IndexedMap("Teach an individual an exercise routine", 33),
    IndexedMap("Help people with family-related problems", 34),
    IndexedMap("Supervise the activities of children at a camp", 35),
    IndexedMap("Teach children how to read", 36),
    IndexedMap("Help elderly people with their daily activities", 37),
    IndexedMap("Sell restaurant franchises to individuals", 40),
    IndexedMap("Sell merchandise at a department store", 41),
    IndexedMap("Manage the operations of a hotel", 42),
    IndexedMap("Operate a beauty salon or barber shop", 43),
    IndexedMap("Manage a department within a large company", 44),
    IndexedMap("Manage a clothing store", 45),
    IndexedMap("Sell houses", 46),
    IndexedMap("Run a toy store", 47),
    IndexedMap("Generate the monthly payroll checks for an office", 50),
    IndexedMap("Inventory supplies using a hand-held computer", 51),
    IndexedMap("Use a computer program to generate customer bills", 52),
    IndexedMap("Maintain employee records", 53),
    IndexedMap("Compute and record statistical and other numerical data", 54),
    IndexedMap("Operate a calculator", 55),
    IndexedMap("Handle customers' bank transactions", 56),
    IndexedMap("Keep shipping and receiving records", 57),
  ];

  // Response options
  final List<IndexedMap> options = [
    IndexedMap("Strongly Disagree", 1),
    IndexedMap("Disagree", 3),
    IndexedMap("Neutral", 4),
    IndexedMap("Agree", 5),
    IndexedMap("Strongly Agree", 7),
  ];

  // Store selected answers
  Map<int, int?> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questionnaire!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                    questions[index].text,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: List.generate(options.length, (optionIndex) {
                    return RadioListTile<int>(
                      title: Text(options[optionIndex].text),
                      value: options[optionIndex].value,
                      groupValue: selectedAnswers[questions[index].value],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[questions[index].value] = value;
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
        backgroundColor: Colors.white,
        onPressed: () {
  if (selectedAnswers.length < questions.length) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please answer all questions before proceeding.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  

  List<int> riasec = [0, 0, 0, 0, 0, 0];
  selectedAnswers.forEach((key, value) {
    riasec[key ~/ 10] += value!;
  });

  Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultPage(
      riasecScores: riasec,
    ),
  ),
);

},
      ),
    );
  }
}

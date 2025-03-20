import 'package:flutter/material.dart';

class HollandDescriptionPage extends StatelessWidget {
  const HollandDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Holland’s Career Model",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E3A5F), // Deep Blue
        centerTitle: true,
        elevation: 5,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A5F), Color(0xFF2C5364)], // Elegant Blue Gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Title
                  const Text(
                    "🔍 What is Holland’s RIASEC Model?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "John Holland’s RIASEC model categorizes careers based on personality types. "
                    "It helps individuals discover careers that best fit their interests.",
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  const SizedBox(height: 20),

                  // ✅ Career Categories (Professional Look)
                  buildCareerCategory(
                    "👨‍🔬 Realistic (Doers)",
                    "Enjoy hands-on work, tools, and technology.",
                    "Examples: Software Engineer, Cybersecurity Analyst",
                    Color(0xFF3E5C76), // Muted Steel Blue
                  ),
                  buildCareerCategory(
                    "📊 Investigative (Thinkers)",
                    "Love solving complex problems and analyzing data.",
                    "Examples: Data Scientist, AI Engineer",
                    Color(0xFF507DBC), // Professional Blue
                  ),
                  buildCareerCategory(
                    "🎨 Artistic (Creators)",
                    "Prefer creativity, design, and self-expression.",
                    "Examples: UI/UX Designer, Game Developer",
                    Color(0xFF9B7E46), // Gold-Infused Brown
                  ),
                  buildCareerCategory(
                    "💼 Enterprising (Persuaders)",
                    "Skilled in leadership, business, and decision-making.",
                    "Examples: Product Manager, Tech Entrepreneur",
                    Color(0xFF576F72), // Elegant Green-Gray
                  ),
                  buildCareerCategory(
                    "🤝 Social (Helpers)",
                    "Enjoy helping people through education, healthcare, or social services.",
                    "Examples: Teacher, HR Manager, Therapist",
                    Color(0xFF6C757D), // Soft Charcoal Gray
                  ),
                  buildCareerCategory(
                    "📋 Conventional (Organizers)",
                    "Prefer structured, rule-driven environments such as finance and data management.",
                    "Examples: Accountant, Data Analyst",
                    Color(0xFF5E6472), // Deep Grayish Blue
                  ),

                  const SizedBox(height: 30),

                  // ✅ Career Quiz Instructions (Elegant Box)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "📌 Steps to Take the Career Quiz:",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3A5F), // Deep Blue
                          ),
                        ),
                        const SizedBox(height: 15),
                        buildInstructionStep(1, "Click the 'Start Quiz' button."),
                        buildInstructionStep(2, "Answer each question carefully."),
                        buildInstructionStep(3, "Once all questions are answered, click the 'Submit' button."),
                        buildInstructionStep(4, "Your RIASEC score will be calculated."),
                        buildInstructionStep(5, "Three job recommendations will be displayed."),
                        buildInstructionStep(6, "Click on each job to view more details."),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ✅ Proceed Button to Home Page (Sleek & Professional)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home'); // ✅ Navigates to Home Page
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 252, 254, 254), // white
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 10,
                      ),
                      child: const Text(
                        "Proceed",
                        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 25, 15, 113), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Helper Widget for Career Categories (Professional Styling)
  Widget buildCareerCategory(String title, String description, String example, Color boxColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: boxColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(description, style: const TextStyle(fontSize: 16, color: Colors.white70)),
          Text(
            example,
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // ✅ Helper Widget for Instruction Steps (Sleek Look)
  Widget buildInstructionStep(int stepNumber, String instruction) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF1E3A5F), // Deep Blue
            ),
            child: Text(
              "$stepNumber",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              instruction,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

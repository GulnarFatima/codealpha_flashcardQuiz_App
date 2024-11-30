import 'package:flutter/material.dart';
import 'dart:math';

class FlashcardQuizPage extends StatefulWidget {
  @override
  _FlashcardQuizPageState createState() => _FlashcardQuizPageState();
}

class _FlashcardQuizPageState extends State<FlashcardQuizPage> {
  final List<Map<String, String>> flashcards = [
    {
      'question': 'What is Flutter?',
      'answer': 'A UI toolkit by Google.',
      'option1': 'A programming language by Google.',
      'option2': 'A UI toolkit by Google.',
      'option3': 'A mobile OS by Apple.',
      'option4': 'A design tool by Adobe.'
    },
    {
      'question': 'What is Dart?',
      'answer': 'A programming language by Google.',
      'option1': 'A game engine.',
      'option2': 'A programming language by Google.',
      'option3': 'A UI framework.',
      'option4': 'A scripting language by Mozilla.'
    },
    {
      'question': 'What is the capital of France?',
      'answer': 'Paris',
      'option1': 'Berlin',
      'option2': 'Madrid',
      'option3': 'Paris',
      'option4': 'Rome'
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answer': 'Mars',
      'option1': 'Venus',
      'option2': 'Mars',
      'option3': 'Jupiter',
      'option4': 'Saturn'
    },
    {
      'question': 'Who wrote "To Kill a Mockingbird"?',
      'answer': 'Harper Lee',
      'option1': 'Harper Lee',
      'option2': 'Mark Twain',
      'option3': 'Jane Austen',
      'option4': 'Ernest Hemingway'
    },
    {
      'question': 'What is the largest mammal?',
      'answer': 'Blue whale',
      'option1': 'African elephant',
      'option2': 'Blue whale',
      'option3': 'Giraffe',
      'option4': 'Sperm whale'
    },
    {
      'question': 'What year did World War II end?',
      'answer': '1945',
      'option1': '1918',
      'option2': '1939',
      'option3': '1945',
      'option4': '1950'
    }
  ];

  late List<Map<String, String>> shuffledFlashcards;
  String? selectedAnswer;
  int currentIndex = 0;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    shuffledFlashcards = List.from(flashcards)..shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    final card = shuffledFlashcards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcard Quiz'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/progress',
                arguments: {
                  'totalFlashcards': flashcards.length,
                  'completedFlashcards': correctAnswers,
                },
              );
            },
            tooltip: 'View Progress',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10,
            shadowColor: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    card['question']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Add a vertical spacing between options
                  for (int i = 1; i <= 4; i++) ...[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.indigo, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Set transparent for gradient to show
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedAnswer = card['option$i'];
                          });

                          if (selectedAnswer == card['answer']) {
                            correctAnswers++;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Correct!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Incorrect. Try again!')),
                            );
                          }

                          if (currentIndex < shuffledFlashcards.length - 1) {
                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                currentIndex++;
                                selectedAnswer = null; // Reset for the next question
                              });
                            });
                          } else {
                            Navigator.pushNamed(
                              context,
                              '/progress',
                              arguments: {
                                'totalFlashcards': flashcards.length,
                                'completedFlashcards': correctAnswers,
                              },
                            );
                          }
                        },
                        child: Text(
                          card['option$i']!,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    // Add spacing between options
                    if (i < 4) SizedBox(height: 10), // Adjust height as needed
                  ],
                  SizedBox(height: 20),
                  if (selectedAnswer != null)
                    Text(
                      'You selected: $selectedAnswer',
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

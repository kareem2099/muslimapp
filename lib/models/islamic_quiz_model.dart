import 'package:flutter/material.dart';
import 'islamic_quiz_list.dart';

class IslamicQuizModel extends StatefulWidget {
  final String difficulty;
  final List<IslamicQuestion> questions;
  const IslamicQuizModel({required this.difficulty, required this.questions});

  @override
  _IslamicQuizModelState createState() => _IslamicQuizModelState();
}

class _IslamicQuizModelState extends State<IslamicQuizModel> {
  int currentIndex = 0;
  int score = 0;
  bool answeredCorrectly = false;
  int selectedChoice = -1;
  late int totalPossibleScore;

  @override
  void initState() {
    super.initState();
    totalPossibleScore = widget.questions
        .map((question) => question.score)
        .reduce((value, element) => value + element);
  }

  Color _getButtonColor(int index) {
    if (selectedChoice == index) {
      return answeredCorrectly ? Colors.green : Colors.red;
    }
    if (answeredCorrectly) {
      return Colors.red;
    }
    return Colors.grey;
  }

  String getScoreMessage(int score) {
    if (score >= 0 && score < 30) {
      return 'Sorry, try harder next time 😔';
    } else if (score >= 30 && score < 50) {
      return 'Do your best next time 🥺🥺';
    } else if (score >= 50 && score < 70) {
      return 'You can do it! 🥺🥺';
    } else if (score >= 70 && score <= totalPossibleScore) {
      return 'Awesome, you are the best! 🥳🥳🥳';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Islamic Quiz - Question ${currentIndex + 1}/${widget.questions.length} | Score: ${score}/${totalPossibleScore}'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.questions[currentIndex].question,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: selectedChoice == -1
                  ? () {
                      checkAnswer(0);
                      setState(() {
                        selectedChoice = 0;
                      });
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => _getButtonColor(0)),
              ),
              child: Text(widget.questions[currentIndex].choices[0]),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: selectedChoice == -1
                  ? () {
                      checkAnswer(1);
                      setState(() {
                        selectedChoice = 1;
                      });
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => _getButtonColor(1)),
              ),
              child: Text(widget.questions[currentIndex].choices[1]),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: selectedChoice == -1
                  ? () {
                      checkAnswer(2);
                      setState(() {
                        selectedChoice = 2;
                      });
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => _getButtonColor(2)),
              ),
              child: Text(widget.questions[currentIndex].choices[2]),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: selectedChoice == -1
                  ? () {
                      checkAnswer(3);
                      setState(() {
                        selectedChoice = 3;
                      });
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => _getButtonColor(3)),
              ),
              child: Text(widget.questions[currentIndex].choices[3]),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (selectedChoice == -1) {
                  // Show alert dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text('Alert'),
                        content: Text('You must choose an option.'),
                      );
                    },
                  );

                  // Automatically dismiss the dialog after 3 seconds
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });

                  return; // Exit the function early
                }

                setState(() {
                  if (currentIndex < widget.questions.length - 1) {
                    currentIndex++;
                    answeredCorrectly = false;
                    selectedChoice = -1; // Reset selected choice
                  } else {
                    // Show results
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Quiz Results'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  'Your score: ${score}/${totalPossibleScore}'),
                              const SizedBox(height: 20),
                              Text(
                                getScoreMessage(score),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                setState(() {
                                  currentIndex = 0;
                                  score = 0;
                                  answeredCorrectly = false;
                                  selectedChoice = -1;
                                });
                              },
                              child: const Text('Reset'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                });
              },
              child: Text(currentIndex < widget.questions.length - 1
                  ? 'Next'
                  : 'Show Results'),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Score:  ${score}/${totalPossibleScore}', // Display the total score
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void checkAnswer(int selectedIndex) {
    if (selectedChoice == -1) {
      // Check if choice hasn't been selected yet
      if (selectedIndex == widget.questions[currentIndex].correctAnswerIndex) {
        // Correct answer logic
        setState(() {
          answeredCorrectly = true;
          selectedChoice = selectedIndex;
          score += widget.questions[currentIndex].score;
        });
      } else {
        // Incorrect answer logic
        setState(() {
          answeredCorrectly = false;
          selectedChoice = selectedIndex;
        });
      }
    }
  }
}

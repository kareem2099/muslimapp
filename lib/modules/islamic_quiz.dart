// islamic_quiz.dart

import 'package:flutter/material.dart';
import 'package:muslimapp/models/islamic_quiz_list.dart';
import 'package:muslimapp/models/islamic_quiz_model.dart';

class IslamicQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Islamic Quiz'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Difficulty Level:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IslamicQuizModel(
                          difficulty: 'Easy', questions: easyQuestions)),
                );
              },
              child: Text('Easy'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IslamicQuizModel(
                          difficulty: 'Medium', questions: mediumQuestions)),
                );
              },
              child: Text('Medium'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IslamicQuizModel(
                            difficulty: 'Hard',
                            questions: hardQuestions,
                          )),
                );
              },
              child: Text('Hard'),
            ),
          ],
        ),
      ),
    );
  }
}

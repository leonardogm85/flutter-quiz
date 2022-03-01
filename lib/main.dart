import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({
    Key? key,
  }) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _selectedQuestion = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
    {
      'text': 'What is your favorite color?',
      'options': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'text': 'What is your favorite animal?',
      'options': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 1},
      ],
    },
    {
      'text': 'What is your favorite instructor?',
      'options': [
        {'text': 'Leonard', 'score': 10},
        {'text': 'Mary', 'score': 5},
        {'text': 'John', 'score': 3},
        {'text': 'Paul', 'score': 1},
      ],
    },
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _reply(int score) {
    if (!hasSelectedQuestion) {
      return;
    }

    setState(() {
      _selectedQuestion++;
      _totalScore += score;
    });
  }

  void _restart() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          centerTitle: true,
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                onReply: _reply,
              )
            : Result(
                score: _totalScore,
                onRestart: _restart,
              ),
      ),
    );
  }
}

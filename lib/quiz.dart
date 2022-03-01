import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/option.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    Key? key,
    required this.questions,
    required this.selectedQuestion,
    required this.onReply,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onReply;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          text: questions[selectedQuestion]['text'] as String,
        ),
        ...(questions[selectedQuestion]['options'] as List<Map<String, Object>>)
            .map(
          (option) => Option(
            text: option['text'] as String,
            onSelected: () => onReply(option['score'] as int),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.score,
    required this.onRestart,
  }) : super(key: key);

  final int score;
  final void Function() onRestart;

  String get result {
    if (score < 8) {
      return 'Congratulations!';
    }
    if (score < 12) {
      return 'You are good!';
    }
    if (score < 16) {
      return 'Impressive!';
    }
    return 'Jedi Level!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            result,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          onPressed: onRestart,
          child: const Text(
            'Restart',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
        )
      ],
    );
  }
}

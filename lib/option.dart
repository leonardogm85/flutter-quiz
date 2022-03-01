import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.onSelected,
  }) : super(key: key);

  final String text;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        onPressed: onSelected,
        child: Text(text),
      ),
    );
  }
}

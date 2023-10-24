import 'package:flutter/material.dart';


class Question extends StatelessWidget {
  const Question({
    required this.questiontext
  });

  final String questiontext;
  @override
  Widget build(BuildContext context) {
    return Text(
      questiontext,
      style: TextStyle(
          fontSize: 25,
          color: Colors.black54.withOpacity(0.8),
          fontWeight: FontWeight.w600
      ),
    );
  }
}
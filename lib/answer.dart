import 'package:flutter/material.dart';

class Answer extends StatefulWidget {

  Answer({required this.optionselect,required this.alphatext,required this.questiontext,required this.answerblockcolor
    ,required this.answercolor});

  final VoidCallback optionselect;
  final String alphatext;
  final String questiontext;
  final Color answerblockcolor;
  final Color answercolor;
  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.optionselect,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            color: widget.answerblockcolor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black54,
                  width: 2.0,
                )
            ),
            child: CircleAvatar(
              backgroundColor: Color(0xFFE6E6E6),
              radius: 13.0,
              child: Text(
                widget.alphatext,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          title: Text(
            widget.questiontext,
            style: TextStyle(
                color: widget.answercolor,
                fontWeight: FontWeight.w900,
                fontSize: 17.0
            ),
          ),
        ),
      ),
    );
  }
}

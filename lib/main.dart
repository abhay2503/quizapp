import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz/answer.dart';
import 'package:quizz/question.dart';
import 'package:quizz/model.dart';
import 'package:quizz/ResultPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin{

  ScrollController? _scrollController=ScrollController();
  int indexselected=-1;
  bool result=false;

  Color inactiveColor=Color(0xFFE6E6E6);
  Color activeColor=Color(0xFF6A54DB);
  int currentIndex=0;
  int score=0;

  final questions=Answerlist.questions;

  void scoreupdate()
  {
    final answerList=questions[currentIndex]['answer'] as List<Map<String, Object>>;

    if(indexselected!=-1){
      if(answerList[indexselected!]['answer']==true)
      {
        setState(() {
          score+=1;
        });
      }
    }

    print(score);
  }

  void currentindex(){
    setState(() {
      currentIndex+=1;
    });

    if(currentIndex==questions.length)
    {
      int scoreres=score;
      currentIndex=0;
      score=0;

      Navigator.push(context,MaterialPageRoute(
          builder: (context)=>ResultPage(
              scoreresult:scoreres,
              totalques:questions.length
          )
      ));
    }
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App',style: TextStyle(color: Colors.black,fontSize: 25),),
        centerTitle: true,
        backgroundColor: Color(0xFFEFEFEF),
        elevation: 0.0,
      ),
      backgroundColor:  Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.0,),
              Text(
                'Question 0${currentIndex+1}/${questions.length}',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFF18598)
                ),
              ),
              SizedBox(height: 20,),
              Question(
                questiontext: questions[currentIndex]['questionText'].toString(),
              ),
              SizedBox(height: 24.0,),
              ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: (questions[currentIndex]['answer'] as List<Map<String, Object>>).length,
                  itemBuilder: (BuildContext context,int index){
                    final answerList=questions[currentIndex]['answer'] as List<Map<String, Object>>;

                    return Answer(
                      optionselect: (){
                        setState(() {
                          indexselected=index;
                        });

                      },
                      answerblockcolor: (indexselected==index)?activeColor:inactiveColor,
                      alphatext: answerList[index]['Alpha'].toString(),
                      questiontext: answerList[index]['text'].toString(),
                      answercolor: (indexselected==index)?Colors.white:Colors.black54,
                    );
                  }),
              SizedBox(height: 40.0,),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  child: Text('Next',style: TextStyle(fontSize: 19.0),),
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Color(0xFF6A54DB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      )
                  ),
                  onPressed:()
                  {
                    currentindex();
                    scoreupdate();
                    setState(() {
                      indexselected=-1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


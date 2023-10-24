import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({required this.scoreresult,required this.totalques});

  final int scoreresult;
  final int totalques;


  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quizz',
        theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
    ),

    home: Scaffold(
    appBar: AppBar(
    title: Text('Quiz',style: TextStyle(color: Colors.black,fontSize: 25),),
    centerTitle: true,
    backgroundColor: Color(0xFFF5F4F4),
    elevation: 0.0,
    ),
    backgroundColor:  Color(0xFFEEEEEE),
    body:Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Your Score',
            style: TextStyle(
                fontSize:35.0,
                color: Colors.black87,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height:40.0,),
          new CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 14.0,
            percent:widget.scoreresult/widget.totalques ,

            center: Text(
              '${((widget.scoreresult/widget.totalques)*100).toStringAsFixed(1)}%',
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            backgroundColor: Colors.grey,
            progressColor:Color(0xFF6A54DB),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Correct Answer:${widget.scoreresult}',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.green.shade900,
              fontWeight: FontWeight.bold,
            ),

          ),
          SizedBox(
            height: 19.0,
          ),
          Text(
            'Wrong Answer:${widget.totalques-widget.scoreresult}',
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
            ),

          ),
          SizedBox(height: 50.0,),
          Container(
            width: 200.0,
            height: 55.0,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.restart_alt,
                    size: 40.0,
                    color: Colors.white,),
                  Text('Re Test',style: TextStyle(fontSize: 27.0,fontWeight: FontWeight.bold),),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: Color(0xFF6A54DB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              onPressed:()
              {
                Navigator.pop(context);

              },
            ),
          )
        ],
      ),
    ) ,
    ),
    );
  }
}

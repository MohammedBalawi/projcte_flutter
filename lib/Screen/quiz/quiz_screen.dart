import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),

        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, '/item_screen');
          }, icon: Icon(Icons.arrow_forward_ios)),

        ],
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 60)

              ),
              onPressed: (){
                Navigator.popAndPushNamed(context, '/creat_screen');
              },
              child:  Text('+   Add new question',style: GoogleFonts.aBeeZee(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),),
          ),
        ],
      ),
    );
  }
}

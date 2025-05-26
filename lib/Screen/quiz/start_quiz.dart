import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projcte_flutter/Screen/controll/database/cache.dart';
import 'package:projcte_flutter/Screen/controll/model/score_page.dart';

// import 'package:quiz_maker/cache.dart';
// import 'package:quiz_maker/score_page.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({Key? key}) : super(key: key);

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  int index = 0;
  List questions = [];

  void getQuestions() async {
    void getQ() async {
      Cache cache = Cache();
      questions = await cache.getQuestions();
    }

    Timer(Duration(seconds: 1), () {
      try {
        setState(() {
          getQ();
        });
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Cache cache = Cache();
    getQuestions();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Quiz App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: questions.length >= 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Question ${index + 1}",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "/${questions.length}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.teal,
                      ),
                      width: size.width - 40,
                      child: Container(
                        width: size.width - 60,
                        height: 120,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            "${questions[index].title}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: MaterialButton(
                      child: Container(
                        height: 55,
                        width: size.width - 60,
                        child: Row(
                          children: [
                            Container(
                              width: size.width - 60,
                              child: Text("${questions[index].answer1}"),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (questions[index].correct == "A") {
                          cache.addMark();
                        }
                        getNextQuestion();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.teal)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: MaterialButton(
                      child: Container(
                        height: 55,
                        width: size.width - 60,
                        child: Row(
                          children: [
                            Container(
                              width: size.width - 60,
                              child: Text("${questions[index].answer2}"),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (questions[index].correct == "B") {
                          cache.addMark();
                        }
                        getNextQuestion();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.teal)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: MaterialButton(
                      child: Container(
                        height: 55,
                        width: size.width - 60,
                        child: Row(
                          children: [
                            Container(
                              width: size.width - 60,
                              child: Text("${questions[index].answer3}"),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (questions[index].correct == "C") {
                          cache.addMark();
                        }
                        getNextQuestion();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.teal)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: MaterialButton(
                      child: Container(
                        height: 55,
                        width: size.width - 60,
                        child: Row(
                          children: [
                            Container(
                              width: size.width - 60,
                              child: Text("${questions[index].answer4}"),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        if (questions[index].correct == "D") {
                          cache.addMark();
                        }
                        getNextQuestion();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.teal)),
                    ),
                  ),
                ],
              )
            : Container());
  }

  getNextQuestion() {
    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else if (index == questions.length - 1) {
      Cache cache = Cache();
      print(cache.getScore());
      if (cache.getScore() >= (questions.length / 2)) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return ScorePage("images/result.jpg", "Success!!",
              "${cache.getScore()}/${questions.length}", "Congratulations!!");
        }));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return ScorePage(
              "images/fail.png",
              "Oops!",
              "${cache.getScore()}/${questions.length}",
              "Sorry, better luck next time!");
        }));
      }
    }
  }
}
//  - imges/images/IMAGE PM.jpg

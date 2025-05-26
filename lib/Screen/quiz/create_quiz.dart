import 'dart:async';

import 'package:flutter/material.dart';

import '../controll/database/cache.dart';
import 'add_quiz.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  List questions = [];

  void sett() {
    setState(() {});
  }

  void getQuestions() async {
    Cache cache = Cache();
    questions = await cache.getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      sett();
    });
    Cache cache = Cache();
    getQuestions();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Create Quiz",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AddNewQuestion();
                  }));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "+ Add new Question",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
          Container(
            height: size.height - 180,
            child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 300,
                      width: 250,
                      color: Colors.grey[300],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                questions[index].title,
                                style: const TextStyle(fontSize: 24),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "Are You Sure You Want to Delete"),
                                            actions: [
                                              MaterialButton(
                                                onPressed: () {
                                                  cache.deleteQuestion(
                                                      questions[index].id);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                              MaterialButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  "No",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: questions[index].correct == "A"
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: 300,
                            child: Text(
                              questions[index].answer1,
                              style: TextStyle(
                                  color: questions[index].correct == "A"
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: questions[index].correct == "B"
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 300,
                              child: Text(
                                questions[index].answer2,
                                style: TextStyle(
                                    color: questions[index].correct == "B"
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: questions[index].correct == "C"
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 300,
                              child: Text(
                                questions[index].answer3,
                                style: TextStyle(
                                    color: questions[index].correct == "C"
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: questions[index].correct == "D"
                                      ? Colors.green
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 300,
                              child: Text(
                                questions[index].answer4,
                                style: TextStyle(
                                    color: questions[index].correct == "D"
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

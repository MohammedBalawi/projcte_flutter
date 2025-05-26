import 'package:flutter/material.dart';

import '../controll/database/cache.dart';
import '../controll/model/question.dart';

class AddNewQuestion extends StatefulWidget {
  const AddNewQuestion({Key? key}) : super(key: key);

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  TextEditingController question = TextEditingController();
  TextEditingController answer1 = TextEditingController();
  TextEditingController answer2 = TextEditingController();
  TextEditingController answer3 = TextEditingController();
  TextEditingController answer4 = TextEditingController();
  String dropValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Add Question",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: question,
                    decoration: InputDecoration(
                        hintText: "Question",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 20,
                    child: Text("A"),
                  ),
                ),
                Container(
                  width: 290,
                  child: TextField(
                    controller: answer1,
                    decoration: InputDecoration(
                        hintText: "First Answer",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 20,
                    child: Text("B"),
                  ),
                ),
                Container(
                  width: 280,
                  child: TextField(
                    controller: answer2,
                    decoration: InputDecoration(
                        hintText: "Second Answer",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 20,
                    child: Text("C"),
                  ),
                ),
                Container(
                  width: 280,
                  child: TextField(
                    controller: answer3,
                    decoration: InputDecoration(
                        hintText: "Third Answer",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 20,
                    child: Text("D"),
                  ),
                ),
                Container(
                  width: 280,
                  child: TextField(
                    controller: answer4,
                    decoration: InputDecoration(
                        hintText: "Fourth Answer",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Select The Correct Answer",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: DropdownButton(
                      value: dropValue,
                      items: const [
                        DropdownMenuItem(
                          value: "A",
                          child: Text(
                            "A",
                            style: TextStyle(color: Colors.teal, fontSize: 17),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "B",
                          child: Text("B",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 17)),
                        ),
                        DropdownMenuItem(
                          value: "C",
                          child: Text("C",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17)),
                        ),
                        DropdownMenuItem(
                          value: "D",
                          child: Text("D",
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 17)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropValue = value.toString();
                        });
                      }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: MaterialButton(
              color: Colors.teal,
              onPressed: () {
                Cache cache = Cache();
                cache.setQuestion(Question(
                    id: 2,
                    title: question.text,
                    answer1: answer1.text,
                    answer2: answer2.text,
                    answer3: answer3.text,
                    answer4: answer4.text,
                    correct: dropValue));
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Add question',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcte_flutter/cache.dart';
import 'package:projcte_flutter/question.dart';
import 'package:projcte_flutter/start_quiz.dart';

import '../db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the database
  await DatabaseHelper.instance.initializeDatabase();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        elevation: 25,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    child: const Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink,
                          child: Text(
                            'M',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'maher@gmail.com',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Maher Attia ',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const CreateQuiz();
                }));
              },
              leading: const Icon(Icons.edit),
              title: const Text('Create Quiz'),
            ),
            ListTile(
              onTap: () async {
                Cache cache = Cache();
                List questions = await cache.getQuestions();
                cache.reInitScore();
                if (questions.length < 1) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text("No Enough Questions"),
                        );
                      });
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const StartQuiz();
                  }));
                }
              },
              leading: const Icon(Icons.quiz),
              title: const Text('Start Quiz'),
            ),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text("Are You Sure You Want to exit"),
                          actions: [
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ]);
                    },
                  );
                }),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('images/IMAGE PM.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                minWidth: 200,
                height: 55,
                child: const Text(
                  "Let's Start!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Cache cache = Cache();
                  cache.reInitScore();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const StartQuiz();
                  }));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.teal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
                child: const Text(
                  "+ Add new Question",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
                      items: [
                        const DropdownMenuItem(
                          child: Text(
                            "A",
                            style: TextStyle(color: Colors.teal, fontSize: 17),
                          ),
                          value: "A",
                        ),
                        const DropdownMenuItem(
                          child: Text("B",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 17)),
                          value: "B",
                        ),
                        const DropdownMenuItem(
                          child: Text("C",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17)),
                          value: "C",
                        ),
                        const DropdownMenuItem(
                          child: Text("D",
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 17)),
                          value: "D",
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
              child: const Text(
                'Add question',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}

// import 'dart:collection';
//
// import 'package:flutter/material.dart';
// import 'package:projcte_flutter/Screen/creat_screen.dart';
// import 'package:projcte_flutter/Screen/item_screen.dart';
// import 'package:projcte_flutter/Screen/launch_screen.dart';
// import 'package:projcte_flutter/Screen/login_screen.dart';
// import 'package:projcte_flutter/Screen/quiz_screen.dart';
// import 'package:projcte_flutter/shared_pref.dart';
//
//
//
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPrefController().iniPreferences();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//
//       // localeW
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/launch_screen',
//       routes: {
//         '/launch_screen': (context) => Launch_screen(),
//         '/login_screen': (context) => LoginScreen(),
//         '/item_screen': (context) => ItemScreen(),
//         '/creat_screen': (context) => CreateQuiz(),
//         '/quiz_screen': (context) => Quiz(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projcte_flutter/Screen/controll/database/cache.dart';
import 'package:projcte_flutter/Screen/quiz/start_quiz.dart';
import 'Screen/controll/database/db.dart';
import 'Screen/quiz/create_quiz.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DatabaseHelper.instance.initializeDatabase();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
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
                            style: TextStyle(fontSize: 30, color: Colors.white),
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
                        'moudybalawi@gmail.com',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'MOHAMMED AL BALAWI',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
              child: Image.asset('images/flutter-brandlogo.net_.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MaterialButton(
                minWidth: 200,
                height: 55,
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
                child: const Text(
                  "Let's Start!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

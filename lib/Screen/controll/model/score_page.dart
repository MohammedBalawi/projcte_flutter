import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  String imagePath;
  String state;
  String mark;
  String description;

  ScorePage(this.imagePath, this.state, this.mark, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Quiz App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$state",
                style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset(imagePath),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Your Score: $mark",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "$description",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: MaterialButton(
              color: Colors.teal,
              child: Text(
                "Back To Home",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  void checkAnswer(bool userChoice) {
    bool check = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.resetQuestionNumber();

        score = [];
      } else {
        if (check == userChoice) {
          score.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          score.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                side: BorderSide(width: 5.0, color: Colors.green.shade900),
                textStyle: const TextStyle(letterSpacing: 2.0),
              ),
              onPressed: () {
                checkAnswer(true);
                Alert(
                  context: context,
                  title: 'Answer',
                  desc: quizBrain.getQuestionComplete(),
                ).show();
              },
              child: const Text(
                'TRUE',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                side: BorderSide(width: 5.0, color: Colors.red.shade900),
              ),
              onPressed: () {
                checkAnswer(false);
                Alert(
                  context: context,
                  title: 'Answer',
                  desc: quizBrain.getQuestionComplete(),
                ).show();
              },
              child: const Text(
                'FALSE',
                style: TextStyle(
                    color: Colors.white, fontSize: 16.0, letterSpacing: 2.0),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 380.0,
              height: 20.0,
              color: Colors.blueGrey.shade900,
              child: Row(
                children: score,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

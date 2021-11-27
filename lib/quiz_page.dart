import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'constant/strings.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    /// correctAnswer = True (or) False
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: kAlertTitle,
          desc: kAlertDescription,
          buttons: [
            DialogButton(
              child: const Text(
                kTextClose,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
      } else {
        /// if the UserPickedAnswer is CorrectAnswer Return True (Tick Icon)
        correctAnswer == userPickedAnswer
            ? scoreKeeper.add(const Icon(
                Icons.check,
                color: Colors.green,
              ))

            /// Else Return False (X icon)

            : scoreKeeper.add(const Icon(
                Icons.close,
                color: Colors.red,
              ));

        quizBrain.getNextQuestion();
      }
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
                child: const Text(
                  kTextTrue,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  checkAnswer(true);
                },
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                kTextFalse,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

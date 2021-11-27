import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int questionNumber = 0;

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
                QuizBrain().questionBank[questionNumber].question,
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
                  'True',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  bool correctAnswer =
                      QuizBrain().questionBank[questionNumber].answer;
                  setState(() {
                    correctAnswer == true
                        ? scoreKeeper.add(const Icon(
                            Icons.check,
                            color: Colors.green,
                          ))
                        : scoreKeeper.add(const Icon(
                            Icons.close,
                            color: Colors.red,
                          ));

                    questionNumber++;
                  });

                  print(questionNumber);
                },
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: const Text(
                'False',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                bool correctAnswer =
                    QuizBrain().questionBank[questionNumber].answer;

                /// Already declared the Answers in the Button
                setState(() {
                  correctAnswer == false
                      ? scoreKeeper.add(const Icon(
                          Icons.check,
                          color: Colors.green,
                        ))

                      /// if the Answer is False Return True

                      : scoreKeeper.add(const Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                  questionNumber++;
                });

                /// Else Return False

                print(questionNumber);
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

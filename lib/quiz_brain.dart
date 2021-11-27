import 'package:quizzler/questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Questions> _questionBank = [
    Questions('question 1', true),
    Questions('question 2', false),
    Questions('question 3', true),
    Questions('question 4', true),
    Questions('question 5', false),
    Questions('question 6', true),
    Questions('question 7', true),
    Questions('question 8', true),
    Questions('question 9', false),
    Questions('question 10', true),
    Questions('question 11', false),
    Questions('question 12', false),
    Questions('question 13', false),
    Questions('question 14', true),
  ];

  void getNextQuestion() {
    ///Last      13                    14                   So, QuestionNumber(13) < QuestionBank Length(14) is true so questionNumber increase 1 index that is 14, But 14 index is 15 Length, But Question Length is till 14, So we can put Length -1, then it will be 14
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }

    /// if the Question Number is Less than Length of the Question bank(14), then only The Question Number will be Increased(questionNumber++)
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].question;

    /// Now Question Bank is a Private Property, So we can't directly Access the _questionBank List out side of that Class, So We create a Function to get the Question Text, then you can Access that Function rather than _questionBank List
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber < _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}

QuizBrain quizBrain = QuizBrain();

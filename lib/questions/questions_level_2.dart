import 'package:quiz_app/answer.dart';
import 'package:quiz_app/levels/level_2.dart';


import '../question.dart';
import '../score.dart';

Level2 a = Level2();

class QuestionsLevel2 {

  int _questionIndex = 0;

  final List <Question> _questionList = [
    Question(question: a.q1, answer: 1),
    Question(question: a.q2, answer: 2),
    Question(question: a.q3, answer: 1),
    Question(question: a.q4, answer: 3),
    Question(question: a.q5, answer: 2),
    Question(question: a.q6, answer: 4),
    Question(question: a.q7, answer: 3),
    Question(question: a.q8, answer: 2),
    Question(question: a.q9, answer: 2),
    Question(question: a.q10, answer: 1),
    Question(question: a.q11, answer: 4),
    Question(question: a.q12, answer: 3),
    Question(question: a.q13, answer: 1),

  ];

  final List <Answer> _answerList = [
    Answer(answer_1: a.q1a1, answer_2: a.q1a2, answer_3: a.q1a3, answer_4: a.q1a4),
    Answer(answer_1: a.q2a1, answer_2: a.q2a2, answer_3: a.q2a3, answer_4: a.q2a4),
    Answer(answer_1: a.q3a1, answer_2: a.q3a2, answer_3: a.q3a3, answer_4: a.q3a4),
    Answer(answer_1: a.q4a1, answer_2: a.q4a2, answer_3: a.q4a3, answer_4: a.q4a4),
    Answer(answer_1: a.q5a1, answer_2: a.q5a2, answer_3: a.q5a3, answer_4: a.q5a4),
    Answer(answer_1: a.q6a1, answer_2: a.q6a2, answer_3: a.q6a3, answer_4: a.q6a4),
    Answer(answer_1: a.q7a1, answer_2: a.q7a2, answer_3: a.q7a3, answer_4: a.q7a4),
    Answer(answer_1: a.q8a1, answer_2: a.q8a2, answer_3: a.q8a3, answer_4: a.q8a4),
    Answer(answer_1: a.q9a1, answer_2: a.q9a2, answer_3: a.q9a3, answer_4: a.q9a4),
    Answer(answer_1: a.q10a1, answer_2: a.q10a2, answer_3: a.q10a3, answer_4: a.q10a4),
    Answer(answer_1: a.q11a1, answer_2: a.q11a2, answer_3: a.q11a3, answer_4: a.q11a4),
    Answer(answer_1: a.q12a1, answer_2: a.q12a2, answer_3: a.q12a3, answer_4: a.q12a4),

  ];

  final List <Score> _scoreList = [
    Score(score: 100),
    Score(score: 200),
    Score(score: 300),
    Score(score: 400),
    Score(score: 500),
    Score(score: 750),
    Score(score: 1000),
    Score(score: 1250),
    Score(score: 3000),
    Score(score: 2000),
    Score(score: 2500),
    Score(score: 3000),
    Score(score: 5000),

  ];

  
  String getQuestionList (){
    return _questionList[_questionIndex].question;
  }

  int getAnswerList(){
    return _questionList[_questionIndex].answer;
  }

  String getAnswers(int answerIndex){
    if(answerIndex == 1){
      return _answerList[_questionIndex].answer_1;
    }
    else if(answerIndex == 2){
      return _answerList[_questionIndex].answer_2;
    }
    else if(answerIndex == 3){
      return _answerList[_questionIndex].answer_3;
    } else {
      return _answerList[_questionIndex].answer_4;
    }
  }

  int getQuestionIndex(){
    return _questionIndex;
  }

  int getQuestionLength(){
    return _questionList.length;
  }

  int getScore(){
    return _scoreList[_questionIndex].score;
  }


  void nextQuestion(){
    if(_questionIndex < _questionList.length){
      _questionIndex++;
    }
  }

  bool isQuizFinish(){
    if(_questionIndex > _questionList.length - 1){
      return true;
    } else {
      return false;
    }
  }

  void resetQuiz(){
    _questionIndex = 0;
  }



}
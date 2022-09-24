import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../questions/questions_level_2.dart';
import '../main_page.dart';

class QuestionPageLevel2 extends StatefulWidget {
  const QuestionPageLevel2({Key? key}) : super(key: key);

  @override
  _QuestionPageLevel2State createState() => _QuestionPageLevel2State();
}

class _QuestionPageLevel2State extends State<QuestionPageLevel2> {
  List<Widget> choices = [];
  QuestionsLevel2 level = QuestionsLevel2();

  int correctNumber=0;
  int wrongNumber=0;

  int totalScore = 0;
  bool isAnswered = false;

  String answerText = '';

  void buttonFunction(int selectedButton) {

    setState(() {

      if(level.getAnswerList() == selectedButton){
        correctNumber++;
        totalScore += level.getScore();
      } else {
        wrongNumber++;
      }

      level.nextQuestion();

      });
  }

  void applyFunction(){
    setState(() {
      if(
        answerText == 'Tenis' ||
        answerText == 'TENİS' ||
        answerText == 'TENIS' ||
        answerText == 'tenis' ||
        answerText == 'Tennis' ||
        answerText == 'TENNIS' ||
        answerText == 'tennis' ){
        correctNumber++;
        totalScore += level.getScore();
      } else {
        wrongNumber++;
      }

      level.nextQuestion();
    });

  }

  bool isLastQuestion(){
    return level.getQuestionIndex()+1 == level.getQuestionLength();
  }

  @override
  Widget build(BuildContext context) {
    return level.isQuizFinish()
    ? SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => const MainPage())));
            },
          ),
          title: Center(child: Image.asset(
            'assets/paribu.png',
            color: kOptionColor,
            fit: BoxFit.cover,
            width: 150, 
            height: 30,)),
          actions: [
            SizedBox(
              height: 50, 
              width: 50,
              child: Center(
                child: Text(
                  '2', 
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'BungeeInline',
                    color: kOptionColor
                    ),
                  ),
                ),
          )],
        ),
        backgroundColor: kParibuColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('    Congrats,\n    You have completed the quiz', style: TextStyle(color: kOptionColor, fontSize: 25, fontFamily: 'BungeeInline')),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text('Your Stats;', style: TextStyle(color: kOptionColor, fontSize: 40, fontFamily: 'BungeeInline')),
                Text('Correct: $correctNumber', style: TextStyle(color: kOptionColor, fontSize: 40, fontFamily: 'BungeeInline')),
                Text('Wrong: $wrongNumber', style: TextStyle(color: kOptionColor, fontSize: 40, fontFamily: 'BungeeInline'),),
                Text('Score: $totalScore', style: TextStyle(color: kOptionColor, fontSize: 40, fontFamily: 'BungeeInline'),),
              ],),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kOptionColor,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => const MainPage())));
                }, 
                child: Text('Return to Main Page', style: TextStyle(color: kParibuColor, fontSize: 20, fontFamily: 'BungeeInline'),),),
            ],
          ),
        )))
    : isLastQuestion() 
    ? SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => const MainPage())));
            },
          ),
          title: Center(child: Image.asset(
            'assets/paribu.png',
            color: kOptionColor,
            fit: BoxFit.cover,
            width: 150, 
            height: 30,)),
          actions: [
            SizedBox(
              height: 50, 
              width: 50,
              child: Center(
                child: Text(
                  '2', 
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'BungeeInline',
                    color: kOptionColor
                    ),),),
        )],
        ),
        backgroundColor: kParibuColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Correct: $correctNumber', style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text('Wrong: $wrongNumber', style: TextStyle(color: kOptionColor, fontSize: 25,fontFamily: 'BungeeInline'),)
                  ],
                ),
                Column(
                  children: [
                    Text('Question', style: TextStyle(color: kOptionColor, fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text('${level.getQuestionIndex()+1}/${level.getQuestionLength()}', style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                  ],
                ),
                Column(
                  children: [
                    Text('Score', style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text(totalScore.toString(), style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    level.getQuestionList(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'BungeeInline',
                      color: kOptionColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  style: TextStyle(color: kOptionColor,fontSize: 20,fontFamily: 'BungeeInline'),
                  textAlign: TextAlign.center,
                  cursorColor: kOptionColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kOptionColor!, width: 2.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kParibuColor, width: 2.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Please, Type your answer here.',
                    hintStyle: TextStyle(color: kOptionColor, fontSize: 15,),
                    
                  ),
                  onChanged: ((value) {
                    answerText = value;
                  }),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                applyFunction();
              },
              style: ElevatedButton.styleFrom(
                primary: kOptionColor,
              ), 
              child: Text('APPLY', style: TextStyle(color: kParibuColor, fontSize: 20, fontFamily: 'BungeeInline'),
              ),
            ),
            const SizedBox(height: 50,)
          ],
    
      ),
    ))
    : SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => const MainPage())));
            },
          ),
          title: Center(child: Image.asset(
            'assets/paribu.png',
            color: kOptionColor,
            fit: BoxFit.cover,
            width: 150, 
            height: 30,)),
          actions: [
            SizedBox(
              height: 50, 
              width: 50,
              child: Center(
                child: Text(
                  '2', 
                  style: TextStyle(
                    fontSize: 40, 
                    fontFamily: 'BungeeInline',
                    color: kOptionColor
                    ),),),
        )],
        ),
        backgroundColor: kParibuColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Correct: $correctNumber', style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text('Wrong: $wrongNumber', style: TextStyle(color: kOptionColor, fontSize: 25,fontFamily: 'BungeeInline'),)
                  ],
                ),
                Column(
                  children: [
                    Text('Question', style: TextStyle(color: kOptionColor, fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text('${level.getQuestionIndex()+1}/${level.getQuestionLength()}', style: TextStyle(color: kOptionColor,fontSize: 25, fontFamily: 'BungeeInline'),),
                  ],
                ),
                Column(
                  children: [
                    Text('Score', style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                    Text(totalScore.toString(), style: TextStyle(color: kOptionColor,fontSize: 25,fontFamily: 'BungeeInline'),),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    level.getQuestionList(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'BungeeInline',
                      color: kOptionColor,
                    ),
                  ),
                ),
              ),
            ),
            Wrap(
              spacing: 3,
              runSpacing: 3,
              children: choices,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kOptionColor,
                                    fixedSize: const Size(500, 100),
                                    ),
                                child: Text(level.getAnswers(1), style: TextStyle(
                                  color: kParibuColor,
                                  fontSize: 25,
                                  fontFamily: 'BungeeInline'),
                                  ),
                                onPressed: () {
      
                                  setState(() {
                                    buttonFunction(1);
                                  });
                                },
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kOptionColor,
                                    fixedSize: const Size(500, 100),
                                    ),
                                child: Text(level.getAnswers(2), style: TextStyle(
                                  color: kParibuColor,
                                  fontSize: 25,
                                  fontFamily: 'BungeeInline'),
                                  ),
                                onPressed: () {
      
                                  setState(() {
                                    buttonFunction(2);
                                  });
                                },
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kOptionColor,
                                    fixedSize: const Size(500, 100),
                                    ),
                                child: Text(level.getAnswers(3), style: TextStyle(
                                  color: kParibuColor,
                                  fontSize: 25,
                                  fontFamily: 'BungeeInline'),
                                  ),
                                onPressed: () {
      
                                  setState(() {
                                    buttonFunction(3);
                                  });
                                },
                              ),
                            ))),
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: kOptionColor,
                                    fixedSize: const Size(500, 100),
                                    ),
                                child: Text(level.getAnswers(4), style: TextStyle(
                                  color: kParibuColor,
                                  fontSize: 25,
                                  fontFamily: 'BungeeInline'),
                                  ),
                                onPressed: () {
      
                                  setState(() {
                                    buttonFunction(4);
                                  });
                                },
                              ),
                            ))),
                            const SizedBox(height: 20,)
                  ])),
            )
          ],
        ),
      ),
    );
  }

  
}
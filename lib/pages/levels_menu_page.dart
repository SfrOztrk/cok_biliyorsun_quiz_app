import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'question_pages/question_lvl_1_page.dart';
import 'question_pages/question_lvl_2_page.dart';
import 'question_pages/question_lvl_3_page.dart';

class LevelsMenuPage extends StatelessWidget {
  const LevelsMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kOptionColor,
      child: ListView(
        children: [
          ListTile(
            title: Center(child: Text('Level 1', style: TextStyle(color: kParibuColor,fontSize: 25,fontFamily: 'BungeeInline'),)),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const QuestionPageLevel1()));
            },
          ),
          Divider(thickness: 2, color: kParibuColor,),
          ListTile(
            title: Center(child: Text('Level 2', style: TextStyle(color: kParibuColor,fontSize: 25,fontFamily: 'BungeeInline'),)),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const QuestionPageLevel2()));
            },
          ),
          Divider(thickness: 2, color: kParibuColor,),
          ListTile(
            title: Center(child: Text('Level 3', style: TextStyle(color: kParibuColor,fontSize: 25,fontFamily: 'BungeeInline'),)),
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => QuestionPageLevel3()));
            },
          ),
        ],
      ),
    );
    
  }
}
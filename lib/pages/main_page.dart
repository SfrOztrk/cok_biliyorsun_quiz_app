
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/levels_menu_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kParibuColor,
        key: _scaffoldKey,
        drawer: const LevelsMenuPage(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: (){
              _scaffoldKey.currentState!.openDrawer();              
            },
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Image.asset(
                  'assets/paribu.png',
                  color: kOptionColor,)),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/cok_biliyorsun.png',
                color: kOptionColor,
                alignment: Alignment.topCenter,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    Text('\n    This is quiz application of the quiz show called "ÇOK BİLİYORSUN" which published by Socrates Youtube Channel',
                    style: TextStyle(color: kOptionColor, fontSize: 18, fontFamily: 'BungeeInline'),),
                    Text('\n    You can select level on menu icon at the top left of the screen and start playing',
                    style: TextStyle(color: kOptionColor, fontSize: 18, fontFamily: 'BungeeInline'),),
                    const SizedBox(height: 50,),
                  ],
                ),

              ),
            ),
          ]),
      ),
    );
  }
}
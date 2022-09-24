import 'package:flutter/material.dart';
import 'package:quiz_app/pages/main_page.dart';
import 'constants.dart';

void main() => runApp(CokBiliyorsun());

class CokBiliyorsun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: kParibuColor,
            body: const SafeArea(
                child: MainPage())));
  }
}




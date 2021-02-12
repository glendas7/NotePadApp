import 'package:flutter/material.dart';
import 'screen/note_screen1.dart';
import 'screen/note_screen2.dart';
import 'screen/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //what you want to display on screen here
    return MaterialApp(
      debugShowCheckedModeBanner: true, //remove debug icon
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[600],
        fontFamily: 'VT323',
        canvasColor: Colors.grey[700],
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        NoteScreen1.routeName: (context) => NoteScreen1(),
        NoteScreen2.routeName: (context) => NoteScreen2(),
      },
    );
  }
}

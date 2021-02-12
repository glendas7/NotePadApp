import 'package:flutter/material.dart';
import 'note_screen1.dart';
import 'note_screen2.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/startScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '📓📕📗📘',
          style: TextStyle(
            fontFamily: 'VT323',
            fontSize: 40.0,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                '👋 NOTEPAD',
                style: TextStyle(fontSize: 40.0, color: Colors.purple[700]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Notes 1',
                style: TextStyle(fontSize: 30.0, color: Colors.pinkAccent),
              ),
              onTap: () => Navigator.pushNamed(context, NoteScreen1.routeName),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Notes 2',
                style: TextStyle(fontSize: 30.0, color: Colors.green[400]),
              ),
              onTap: () => Navigator.pushNamed(context, NoteScreen2.routeName),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'NOTEPAD',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 80.0,
                  fontFamily: 'Monofett',
                ),
              ),
            ),
            MyStatefulWidget(),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/spots.jpg'), fit: BoxFit.fill),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, .5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            // FlutterLogo(size: 150.0),
          ),
          Image.asset(
            'images/notepad.png',
            height: 200.0,
          ),
        ],
      ),
    );
  }
}

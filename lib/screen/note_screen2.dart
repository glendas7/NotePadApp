import 'package:flutter/material.dart';

class NoteScreen2 extends StatelessWidget {
  static const routeName = '/noteScreen2';
  String temp = " ";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'NOTES',
          style: TextStyle(fontFamily: 'VT323', fontSize: 40.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/clouds.png'), fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'NOTES',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 100.0,
                    fontFamily: 'Monofett',
                  ),
                ),
                MyStatefulWidget(),
                Divider(
                  height: 30.0,
                  thickness: 5,
                  color: Colors.lightBlue[300],
                ),
                Container(
                  width: 400.0,
                  height: 300.0,
                  child: TextField(
                    controller: myController,
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: null,
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                    obscureText: false,
                    decoration: InputDecoration(
                      filled: true,
                      hintStyle:
                          TextStyle(color: Colors.purpleAccent, fontSize: 30.0),
                      fillColor: Color(0xFFDBEDFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.purple),
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 80.0,
                  child: RaisedButton(
                    color: Colors.blueAccent,
                    child: Text('Complete',
                        style: Theme.of(context).textTheme.headline4),
                    onPressed: () {
                      temp = myController.text;
                      myController.text = "";
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Note was deleted containing: ' + temp,
                              style: TextStyle(
                                  fontFamily: 'VT323', fontSize: 40.0),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
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
      end: const Offset(0, .1),
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
            'images/heart.png',
            height: 100.0,
          ),
        ],
      ),
    );
  }
}

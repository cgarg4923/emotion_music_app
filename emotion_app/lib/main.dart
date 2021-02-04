import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lights = false;
  bool i = false;
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF284D57), Color(0xFF262626)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected[2] = false;
                        isSelected[0] = true;
                        isSelected[1] = false;
                      });
                    },
                    color: isSelected[0] ? Colors.pinkAccent : Colors.black,
                    child: Icon(
                      CupertinoIcons.house,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected[2] = false;
                        isSelected[0] = false;
                        isSelected[1] = true;
                      });
                    },
                    color: isSelected[1] ? Colors.pinkAccent : Colors.black,
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onPressed: () {
                      setState(() {
                        isSelected[2] = true;
                        isSelected[0] = false;
                        isSelected[1] = false;
                      });
                    },
                    color: isSelected[2] ? Colors.pinkAccent : Colors.black,
                    child: Icon(
                      CupertinoIcons.music_albums_fill,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: i
                ? LinearGradient(
                    colors: [
                      Color(0xFFF8F8F8),
                      Colors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                  )
                : LinearGradient(
                    colors: [
                      Color(0xFF284D57),
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0]),
          ),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Good Evening',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Icon(
                      Icons.wb_sunny_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: Colors.grey,
                        value: _lights,
                        onChanged: (bool value) {
                          setState(() {
                            _lights = value;
                            i = !i;
                          });
                        },
                      ),
                    ),
                    Icon(
                      CupertinoIcons.moon,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

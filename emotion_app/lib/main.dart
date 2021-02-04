import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Bottom Nav Bar/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _lights = true;
  bool i = false;
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Bottom_Nav_Bar(
          i: i,
          isSelected: isSelected,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              i ? Color(0xFFF8F8F8) : Color(0xFF284D57),
              i ? Colors.white : Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          )),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              'Good Evening',
                              style: TextStyle(
                                color: i ? Colors.black : Colors.white,
                                fontSize: 25,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.wb_sunny_outlined,
                              color: i ? Colors.black : Colors.white,
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
                              color: i ? Colors.black : Colors.white,
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       i ? Colors.black : Color(0xFF284D57),
                //       i ? Colors.black : Colors.black,
                //     ],
                //     begin: Alignment.centerLeft,
                //     end: Alignment.centerRight,
                //   ),
                // ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ListTileTheme(
                      tileColor: Color(0xFF274A53),
                      contentPadding: EdgeInsets.only(left: 100, right: 5),
                      child: ListTile(
                        title: Text(
                          'Style',
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Taylor Swift',
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Wrap(
                          spacing: 0, // space between two icons
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.suit_heart,
                              ),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(
                                  CupertinoIcons.smiley,
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(
                                  CupertinoIcons.play_fill,
                                  color: Colors.white,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 13,
                      bottom: 10,
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          boxShadow: [
                            //color: Colors.white, //background color of box
                            //color: Colors.white,
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4.0, // soften the shadow
                              //spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                1.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: AssetImage('images/lover.jpeg'),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
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

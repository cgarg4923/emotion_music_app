import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Bottom Nav Bar/bottom_nav_bar.dart';
import 'PlayerPage/player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 180),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    //controller.forward();
    animation.addListener(() {
      setState(() {});
    });
  }

  bool _lights = true;
  bool i = false;
  bool player = false;
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
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 85.0),
                          child: LinearProgressIndicator(
                            minHeight: 3,
                            value: animation.value,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.pinkAccent),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        ListTileTheme(
                          //tileColor: Color(0xFF274A53),
                          contentPadding: EdgeInsets.only(left: 110, right: 5),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  i ? Color(0xFFF8F8F8) : Color(0xFF284D57),
                                  i ? Color(0xFFF8F8F8) : Colors.black,
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                'Style',
                                style: TextStyle(
                                    color: i ? Colors.black : Colors.white),
                              ),
                              subtitle: Text(
                                'Taylor Swift',
                                style: TextStyle(
                                    color: i ? Colors.grey : Colors.blueGrey),
                              ),
                              trailing: Wrap(
                                spacing: 0, // space between two icons
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        CupertinoIcons.suit_heart,
                                      ),
                                      onPressed: () {},
                                      color: i ? Colors.black : Colors.white),
                                  IconButton(
                                      icon: Icon(CupertinoIcons.smiley,
                                          color:
                                              i ? Colors.black : Colors.white),
                                      onPressed: () {}),
                                  IconButton(
                                    icon: Icon(
                                        player
                                            ? CupertinoIcons.pause_fill
                                            : CupertinoIcons.play_fill,
                                        color: i ? Colors.black : Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        player = !player;
                                        if (controller.isAnimating) {
                                          controller.stop();
                                        } else {
                                          controller.forward();
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 13,
                      bottom: 15,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            //color: Colors.white, //background color of box
                            //color: Colors.white,
                            BoxShadow(
                              color: !i ? Colors.black : Colors.grey,
                              blurRadius: 4.0, // soften the shadow
                              //spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                1.0, // Move to right 10  horizontally
                                1.0, // Move to bottom 10 Vertically
                              ),
                            ),
                          ],
                          image: DecorationImage(
                            // fit: BoxFit.fill,
                            image: AssetImage(
                              'images/lover.jpeg',
                            ),
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

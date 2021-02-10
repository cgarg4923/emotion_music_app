import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  bool i;
  List<bool> isSelected;
  Bottom_Nav_Bar({this.i, this.isSelected});

  @override
  _Bottom_Nav_BarState createState() => _Bottom_Nav_BarState();
}

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: !widget.i
              ? [Color(0xFF284D57), Color(0xFF262626)]
              : [Color(0xFFFCFCFC), Color(0xFFFCFCFC)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                setState(() {
                  widget.isSelected[2] = false;
                  widget.isSelected[0] = true;
                  widget.isSelected[1] = false;
                });
              },
              color: widget.isSelected[0]
                  ? Colors.pinkAccent
                  : !widget.i
                      ? Colors.black
                      : Colors.grey,
              child: Icon(
                CupertinoIcons.house,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                setState(() {
                  widget.isSelected[2] = false;
                  widget.isSelected[0] = false;
                  widget.isSelected[1] = true;
                });
              },
              color: widget.isSelected[1]
                  ? Colors.pinkAccent
                  : !widget.i
                      ? Colors.black
                      : Colors.grey,
              child: Icon(
                CupertinoIcons.search,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                setState(() {
                  widget.isSelected[2] = true;
                  widget.isSelected[0] = false;
                  widget.isSelected[1] = false;
                });
              },
              color: widget.isSelected[2]
                  ? Colors.pinkAccent
                  : !widget.i
                      ? Colors.black
                      : Colors.grey,
              child: Icon(
                CupertinoIcons.music_albums_fill,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

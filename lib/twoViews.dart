import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  AnimationController _controller;

  MainActivity(this._controller);

  
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
static const _headerHeight = 30.0;
Widget activityContainer(BuildContext context,BoxConstraints constraint){

final ThemeData _theme = Theme.of(context);
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          color: _theme.primaryColor,
          child: Center(
            child: Text("Back View",
            style: TextStyle(
              fontSize: 30
            ),),
          ),
        ),
        Material(
          elevation: 16,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16)
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: _headerHeight,
                  child: Text("Marvel"),
                ),
                Container(
                  child: Center(
                    child: Text("Captain America",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red),),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
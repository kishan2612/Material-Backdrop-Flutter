import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  AnimationController _controller;

  MainActivity(this._controller);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  static const _headerHeight = 40.0;
  Widget activityContainer(BuildContext context, BoxConstraints constraint) {
    final ThemeData _theme = Theme.of(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: _theme.primaryColor,
            child: Center(
              child: Text(
                "Back View",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          PositionedTransition(
            rect: _getActivityAnimation(constraint),
            child: Material(
              elevation: 16,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16)),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: _headerHeight,
                      child: Center(
                        child: Text(
                          "Marvel",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Text(
                            "Captain America",
                            style: TextStyle(fontSize: 25, color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Animation<RelativeRect> _getActivityAnimation(BoxConstraints contraints) {
    final _maxHeight = contraints.biggest.height;
    final _backViewHeight = _maxHeight - _headerHeight;
    final _frontViewHeight = -_headerHeight;

    return RelativeRectTween(
            begin:
                RelativeRect.fromLTRB(0, _backViewHeight, 0, _frontViewHeight),
            end: RelativeRect.fromLTRB(0, 0, 0, 0))
        .animate(
            CurvedAnimation(parent: widget._controller, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: activityContainer,
    );
  }
}

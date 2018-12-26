import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  AnimationController _controller;

  MainActivity(this._controller);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  static const _headerHeight = 40.0;

  static var _superHero = "CaptainAmerica";

  bool _isBackpanelVisible() {
    final AnimationStatus status = widget._controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void animate(String hero) {
    setState(() {
      _superHero = hero;
    });
    widget._controller.fling(velocity: _isBackpanelVisible() ? -1.0 : 1.0);
  }

  void _backViewOnClick(int position) {
    switch (position) {
      case 0:
        animate("Captain America");
        break;
      case 1:
        animate("Iron Man");
        break;
      case 2:
        animate("Thor");
        break;
      case 3:
        animate("Hulk");
        break;

      default:
    }
  }

  Widget activityContainer(BuildContext context, BoxConstraints constraint) {
    final ThemeData _theme = Theme.of(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: _theme.primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () => _backViewOnClick(0),
                    child:
                        Text("Captain America", style: TextStyle(fontSize: 30)),
                  ),
                  MaterialButton(
                    onPressed: () => _backViewOnClick(1),
                    child: Text(
                      "Iron Man",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => _backViewOnClick(2),
                    child: Text(
                      "Thor",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => _backViewOnClick(3),
                    child: Text(
                      "Hulk",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
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
                            _superHero,
                            style: TextStyle(fontSize: 30, color: Colors.red),
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

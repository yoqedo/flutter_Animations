import 'package:flutter/material.dart';

class AnimatedButto extends StatefulWidget {
  final String initFirstText, initSecondText;
  final Duration animationDuration;
  final ButtonStyle buttonStyle;
  final double iconSize;
  final IconData iconData;

  AnimatedButto(
      {this.initFirstText,
      this.initSecondText,
      this.buttonStyle,
      this.animationDuration,
      this.iconSize,
      this.iconData});

  @override
  _AnimatedButtoState createState() => _AnimatedButtoState();
}

class _AnimatedButtoState extends State<AnimatedButto>
    with TickerProviderStateMixin {
  AnimationController _controller;
  ButtonState _currentState;
  Duration _smallDuration;

  @override
  void initState() {
    super.initState();
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _smallDuration = Duration(
        milliseconds: (widget.animationDuration.inMilliseconds * 0.2).round());
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _controller.addListener(() {
      double _controllerValue = _controller.value;
      if (_controllerValue < 0.2) {
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      } else if (_controllerValue > 0.8) {
        setState(() {
          _currentState = ButtonState.SHOW_ICON_TEXT;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.buttonStyle.elevation,
      borderRadius:
          BorderRadius.all(Radius.circular(widget.buttonStyle.borderRadius)),
      child: InkWell(
          onTap: () {
            _controller.forward();
          },
          child: AnimatedContainer(
            duration: _smallDuration,
            height: widget.iconSize + 28,
            padding: EdgeInsets.symmetric(
                horizontal:
                    (_currentState == ButtonState.SHOW_ONLY_ICON) ? 16 : 48.0,
                vertical: 8),
            decoration: BoxDecoration(
              color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                      _currentState == ButtonState.SHOW_ICON_TEXT)
                  ? widget.buttonStyle.secondaryColor
                  : widget.buttonStyle.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(widget.buttonStyle.borderRadius),
              ),
              border: Border.all(
                color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_ICON_TEXT)
                    ? widget.buttonStyle.primaryColor
                    : Colors.transparent,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (_currentState == ButtonState.SHOW_ONLY_ICON ||
                        _currentState == ButtonState.SHOW_ICON_TEXT)
                    ? Icon(
                        widget.iconData,
                        size: widget.iconSize,
                        color: widget.buttonStyle.primaryColor,
                      )
                    : Container(),
                SizedBox(
                    width:
                        (_currentState == ButtonState.SHOW_ICON_TEXT) ? 20 : 0),
                getTextWidget(),
              ],
            ),
          )),
    );
  }

  Widget getTextWidget() {
    if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
      return Text(
        widget.initFirstText,
        style: widget.buttonStyle.firstTextStyle,
      );
    } else if (_currentState == ButtonState.SHOW_ONLY_ICON) {
      return Container();
    } else {
      return Text(
        widget.initSecondText,
        style: widget.buttonStyle.secondTextStyle,
      );
    }
  }
}

class ButtonStyle {
  final TextStyle firstTextStyle, secondTextStyle;
  final Color primaryColor, secondaryColor;

  final double elevation, borderRadius;

  ButtonStyle(
      {this.firstTextStyle,
      this.secondTextStyle,
      this.primaryColor,
      this.secondaryColor,
      this.elevation,
      this.borderRadius});
}

//Button hase 3 States
enum ButtonState { SHOW_ONLY_TEXT, SHOW_ONLY_ICON, SHOW_ICON_TEXT }

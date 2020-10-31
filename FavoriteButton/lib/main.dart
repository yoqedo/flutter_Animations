import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Option Button',
      home: FavoriteButton(),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation yellowAnimation,
      yellowStarTween,
      greyStarTween,
      openHole,
      rotateTween,
      rotateTween2,
      blinkTween;

  var degreesRadians = pi / 180;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..addListener(() {
            setState(() {});
          });

    greyStarTween = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 60), weight: 40),
      TweenSequenceItem<double>(tween: Tween(begin: 60, end: -60), weight: 60),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.250)));
    rotateTween = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: degreesRadians * 0, end: degreesRadians * 180),
          weight: 50),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.250)));
    yellowStarTween = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: -60, end: 100), weight: 40),
      TweenSequenceItem<double>(tween: Tween(begin: 100, end: 100), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 100, end: 0), weight: 10),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.250, 0.500)));
    rotateTween2 = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween(begin: degreesRadians * 280, end: degreesRadians * 360),
          weight: 50),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.250, 0.500)));
    blinkTween = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 6, end: 3), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 3, end: 6), weight: 50),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.550, 0.700)));
    openHole = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 50), weight: 10),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 50), weight: 70),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 0), weight: 20),
    ]).animate(
        CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.450)));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      body: Center(
        child: Container(
          height: 170,
          child: Stack(children: [
            Container(
              //color: Color.fromRGBO(9, 9, 12, 1),
              height: 160,
              width: 60,
            ),
            _Hole(openHole: openHole),
            _GreyStar(
                greyStarTween: greyStarTween,
                controller: _controller,
                rotateTween: rotateTween),
            _YellowStar(
              yellowStarTween: yellowStarTween,
              controller: _controller,
              rotateTween2: rotateTween2,
              blinkTween: blinkTween,
            ),
          ]),
        ),
      ),
    );
  }
}

class _Hole extends StatelessWidget {
  const _Hole({
    Key key,
    @required this.openHole,
  }) : super(key: key);

  final Animation openHole;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 20,
        width: 60,
        //color: Colors.black,
        child: Align(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              height: 15,
              width: openHole.value,
              color: Color.fromRGBO(9, 9, 12, 1),
            ),
          ),
        ),
      ),
    );
  }
}

class _YellowStar extends StatelessWidget {
  const _YellowStar({
    Key key,
    @required this.yellowStarTween,
    @required AnimationController controller,
    @required this.rotateTween2,
    @required this.blinkTween,
  })  : _controller = controller,
        super(key: key);

  final Animation yellowStarTween;
  final AnimationController _controller;
  final Animation rotateTween2;
  final Animation blinkTween;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: yellowStarTween.value,
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Transform.rotate(
          angle: rotateTween2.value,
          child: Stack(
            children: [
              Icon(Icons.grade,
                  color: Color.fromRGBO(246, 194, 6, 1), size: 60),
              Positioned(
                left: 22.5,
                top: 24.5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: blinkTween.value,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                          ),
                        ),
                        SizedBox(width: 3),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(51, 51, 51, 1),
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.5),
                    Container(
                      width: 12,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 51, 51, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70)),
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

class _GreyStar extends StatelessWidget {
  const _GreyStar({
    Key key,
    @required this.greyStarTween,
    @required AnimationController controller,
    @required this.rotateTween,
  })  : _controller = controller,
        super(key: key);

  final Animation greyStarTween;
  final AnimationController _controller;
  final Animation rotateTween;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        bottom: greyStarTween.value,
        child: GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Transform.rotate(
            angle: rotateTween.value,
            child: Stack(
              children: [
                Icon(Icons.grade,
                    color: Color.fromRGBO(126, 126, 134, 1), size: 60),
                Positioned(
                  left: 22.5,
                  top: 24.5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                          ),
                          SizedBox(width: 3),
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(51, 51, 51, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.5),
                      Container(
                        width: 12,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(51, 51, 51, 1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

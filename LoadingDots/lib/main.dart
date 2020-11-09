import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Loading Dots',
      home: LoadingDots(),
    );
  }
}

class LoadingDots extends StatefulWidget {
  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation firstCircle,
      secondCircle,
      thirdCircle,
      fourtCircle,
      firstCircle2,
      secondCircle2,
      thirdCircle2,
      fourtCircle2;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
          ..addListener(() {
            setState(() {});
          });
    firstCircle = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.200),
      ),
    );
    secondCircle = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.100, 0.300),
      ),
    );
    thirdCircle = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.200, 0.400),
      ),
    );
    fourtCircle = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.300, 0.500),
      ),
    );

    firstCircle2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 0), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 25), weight: 33),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.200),
      ),
    );
    secondCircle2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 0), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 50), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 33),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.200),
      ),
    );
    thirdCircle2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 50), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 0), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 25), weight: 33),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.200),
      ),
    );
    fourtCircle2 = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 25, end: 0), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 50), weight: 33),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 25), weight: 33),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.200),
      ),
    );
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlipCard(
        speed: 800,
        direction: FlipDirection.HORIZONTAL,
        back: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: firstCircle2.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: secondCircle2.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: thirdCircle2.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: fourtCircle2.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
        front: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.grey[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: firstCircle.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: secondCircle.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: thirdCircle.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ]),
              Stack(children: [
                Container(
                  height: 75,
                  width: 25,
                ),
                Positioned(
                  bottom: fourtCircle.value,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black87),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

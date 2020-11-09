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
      title: 'Flutter Credit Cards Animation',
      home: CreditCards(),
    );
  }
}

class CreditCards extends StatefulWidget {
  @override
  _CreditCardsState createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards>
    with TickerProviderStateMixin {
  AnimationController _controller, _controller2;
  Tween<double> rotateTween, rotateTween2, scaleTween, scaleTween2, scaleTween3;
  Animation rotateAnimation,
      rotateAnimation2,
      scaleAnimation,
      scaleAnimation2,
      scaleAnimation3;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..addListener(() {
            setState(() {});
          });

    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..addListener(() {
            setState(() {});
          });

    scaleTween = Tween(begin: 70, end: 0);
    scaleAnimation = scaleTween.animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(
          0.125,
          0.450,
        )));
    scaleTween2 = Tween(begin: 80, end: 30);
    scaleAnimation2 = scaleTween2.animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(
          0.430,
          0.700,
        )));
    scaleTween3 = Tween(begin: 90, end: 65);
    scaleAnimation3 = scaleTween3.animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(
          0.680,
          0.850,
        )));

    rotateTween = Tween(begin: 0, end: 14);
    rotateAnimation = rotateTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.450,
        )));
    rotateTween2 = Tween(begin: 0, end: 24);
    rotateAnimation2 = rotateTween2.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.430,
          0.700,
        )));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double degrees2Radians = pi / 180.0;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(8, 32, 47, 1),
        body: Center(
          child: Column(
            children: [
              _UpperCards(
                  degrees2Radians: degrees2Radians,
                  rotateAnimation2: rotateAnimation2,
                  rotateAnimation: rotateAnimation),
              SizedBox(height: 20),
              _GestureButton(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}

class _UpperCards extends StatelessWidget {
  const _UpperCards({
    Key key,
    @required this.degrees2Radians,
    @required this.rotateAnimation2,
    @required this.rotateAnimation,
  }) : super(key: key);

  final double degrees2Radians;
  final Animation rotateAnimation2;
  final Animation rotateAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 200,
        width: 250,
        //color: Colors.red,
      ),
      Transform.translate(
        offset: Offset(40, 80),
        child: Transform.rotate(
          angle: degrees2Radians * rotateAnimation2.value,
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(199, 155, 90, 1),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'GOLD',
                style: TextStyle(
                  color: Color.fromRGBO(155, 148, 116, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(20, 90),
        child: Transform.rotate(
          angle: degrees2Radians * rotateAnimation.value,
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Transform.translate(
              offset: Offset(10, 10),
              child: Stack(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(228, 0, 26, 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20, 0),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(239, 153, 26, 0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, 100),
        child: Transform.rotate(
          angle: degrees2Radians * 0,
          alignment: Alignment.bottomRight,
          child: Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(53, 97, 152, 1),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
            child: Transform.translate(
              offset: Offset(10, 10),
              child: Stack(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VISA',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 10,
                          width: 100,
                          child: Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(169, 169, 169, 1),
                                ),
                              ),
                              SizedBox(width: 3),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(169, 169, 169, 1),
                                ),
                              ),
                              SizedBox(width: 3),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(169, 169, 169, 1),
                                ),
                              ),
                              SizedBox(width: 3),
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(169, 169, 169, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                          height: 10,
                          width: 120,
                          color: Color.fromRGBO(169, 169, 169, 1),
                        ),
                        SizedBox(height: 3),
                        Container(
                          height: 10,
                          width: 30,
                          color: Color.fromRGBO(169, 169, 169, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class _GestureButton extends StatelessWidget {
  const _GestureButton({
    Key key,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
        child: Text('My Cards', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ignore: unused_element
class _UnderCards extends StatelessWidget {
  const _UnderCards({
    Key key,
    @required this.scaleAnimation,
    @required this.scaleAnimation2,
    @required this.scaleAnimation3,
  }) : super(key: key);

  final Animation scaleAnimation;
  final Animation scaleAnimation2;
  final Animation scaleAnimation3;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 150,
        width: 110,
        //color: Colors.lightBlue,
      ),
      Transform.translate(
        offset: Offset(0, scaleAnimation.value),
        child: Container(
          height: 150,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromRGBO(199, 155, 90, 1),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'GOLD',
              style: TextStyle(
                color: Color.fromRGBO(155, 148, 116, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, scaleAnimation2.value),
        child: Container(
          height: 150,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      //color: Colors.red,
                      ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(228, 0, 26, 0.8),
                    shape: BoxShape.circle,
                  ),
                ),
                Transform.translate(
                  offset: Offset(20, 0),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 153, 26, 0.8),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, scaleAnimation3.value),
        child: Container(
          height: 150,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'VISA',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(0, 100),
        child: Container(
          height: 150,
          width: 120,
          color: Colors.black,
        ),
      ),
    ]);
  }
}

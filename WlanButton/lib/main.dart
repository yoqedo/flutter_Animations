import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Wlan Button',
      home: WlanButton(),
    );
  }
}

class WlanButton extends StatefulWidget {
  @override
  _WlanButtonState createState() => _WlanButtonState();
}

class _WlanButtonState extends State<WlanButton> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> firstTween,
      secondTween,
      thirdTween,
      fourtTween,
      opacityTween,
      opacityTween2,
      opacityTween3;
  Animation firstAnimation,
      secondAnimation,
      thirdAnimation,
      fourtAnimation,
      opacityAnimation,
      opacityAnimation2,
      opacityAnimation3,
      rightLeftAnimation,
      leftRightAnimation;
  Tween<Alignment> rightLeftTween, leftRightTween;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000))
          ..addListener(() {
            setState(() {});
          });
    //first Interval
    firstTween = Tween(begin: 20, end: 60);
    firstAnimation = firstTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.450,
        )));
    rightLeftTween =
        AlignmentTween(begin: Alignment.centerRight, end: Alignment.centerLeft);
    rightLeftAnimation = rightLeftTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.450,
        )));

    //Second Interval
    opacityTween = Tween(begin: 0, end: 1);
    opacityAnimation = opacityTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.450,
          0.470,
        )));
    opacityTween2 = Tween(begin: 1, end: 0);
    opacityAnimation2 = opacityTween2.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.450,
          0.470,
        )));

    //Third Interval
    secondTween = Tween(begin: 20, end: 100);
    secondAnimation = secondTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.500,
          0.800,
        )));

    thirdTween = Tween(begin: 0, end: 120);
    thirdAnimation = thirdTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.500,
          0.800,
        )));

    opacityTween3 = Tween(begin: 0, end: 1);
    opacityAnimation3 = opacityTween3.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.750,
          0.780,
        )));

    //Fourth Interval
    fourtTween = Tween(begin: 20, end: 140);
    fourtAnimation = fourtTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.840,
          1.0,
        )));
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
          height: 150,
          child: Column(
            children: [
              _ThirdStroke(
                  rightLeftAnimation: rightLeftAnimation,
                  opacityAnimation2: opacityAnimation2,
                  thirdAnimation: thirdAnimation,
                  opacityAnimation: opacityAnimation,
                  fourtAnimation: fourtAnimation,
                  opacityAnimation3: opacityAnimation3),
              SizedBox(height: 10),
              _SecondStroke(
                  rightLeftAnimation: rightLeftAnimation,
                  secondAnimation: secondAnimation),
              SizedBox(height: 10),
              _FirstStroke(firstAnimation: firstAnimation),
              SizedBox(height: 10),
              _GestureButton(controller: _controller),
            ],
          ),
        ),
      ),
    );
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
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
    );
  }
}

class _ThirdStroke extends StatelessWidget {
  const _ThirdStroke({
    Key key,
    @required this.rightLeftAnimation,
    @required this.opacityAnimation2,
    @required this.thirdAnimation,
    @required this.opacityAnimation,
    @required this.fourtAnimation,
    @required this.opacityAnimation3,
  }) : super(key: key);

  final Animation rightLeftAnimation;
  final Animation opacityAnimation2;
  final Animation thirdAnimation;
  final Animation opacityAnimation;
  final Animation fourtAnimation;
  final Animation opacityAnimation3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20,
          width: 140,
          decoration: BoxDecoration(
            //color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Align(
            alignment: rightLeftAnimation.value,
            child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[800]
                      .withOpacity(opacityAnimation2.value),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                )),
          ),
        ),
        Transform.translate(
          offset: Offset(thirdAnimation.value, 0),
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color:
                    Colors.lightBlue[800].withOpacity(opacityAnimation.value),
                borderRadius: BorderRadius.all(Radius.circular(60))),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 20,
            width: fourtAnimation.value,
            decoration: BoxDecoration(
                color:
                    Colors.lightBlue[800].withOpacity(opacityAnimation3.value),
                borderRadius: BorderRadius.all(Radius.circular(60))),
          ),
        ),
      ],
    );
  }
}

class _SecondStroke extends StatelessWidget {
  const _SecondStroke({
    Key key,
    @required this.rightLeftAnimation,
    @required this.secondAnimation,
  }) : super(key: key);

  final Animation rightLeftAnimation;
  final Animation secondAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20,
          width: 100,
          decoration: BoxDecoration(
            //color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Align(
            alignment: rightLeftAnimation.value,
            child: Container(
              height: 20,
              width: secondAnimation.value,
              decoration: BoxDecoration(
                color: Colors.lightBlue[800],
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FirstStroke extends StatelessWidget {
  const _FirstStroke({
    Key key,
    @required this.firstAnimation,
  }) : super(key: key);

  final Animation firstAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20,
          width: 60,
          decoration: BoxDecoration(
            //color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 20,
              width: firstAnimation.value,
              decoration: BoxDecoration(
                color: Colors.lightBlue[600],
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

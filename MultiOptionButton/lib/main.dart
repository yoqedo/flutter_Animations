import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Option Button',
      home: MultiOptionButton(),
    );
  }
}

class MultiOptionButton extends StatefulWidget {
  @override
  _MultiOptionButtonState createState() => _MultiOptionButtonState();
}

class _MultiOptionButtonState extends State<MultiOptionButton>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Tween<double> transformTween, rotateIcon;
  Animation transformAnimation, rotationScaleTop, overlayScale, rotateAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400))
          ..addListener(() {
            setState(() {});
          });

    transformTween = Tween<double>(begin: -80, end: -80)..animate(_controller);
    transformAnimation = transformTween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    rotateIcon = Tween<double>(begin: 0, end: 45);
    rotateAnimation = rotateIcon.animate(_controller);
    rotationScaleTop = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1.3), weight: 80),
      TweenSequenceItem<double>(tween: Tween(begin: 1.3, end: 1.0), weight: 20),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    overlayScale = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1.4), weight: 80),
      TweenSequenceItem<double>(tween: Tween(begin: 1.4, end: 1.0), weight: 20),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double degressfrom = pi / 180;
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 34, 44, 1),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _IconContainer(
                rotationScaleTop: rotationScaleTop,
                transformAnimation: transformAnimation),
            _OverlayButton(overlayScale: overlayScale),
            _FabButton(
                degressfrom: degressfrom,
                rotateAnimation: rotateAnimation,
                controller: _controller),
          ],
        ),
      ),
    );
  }
}

class _FabButton extends StatelessWidget {
  const _FabButton({
    Key key,
    @required this.degressfrom,
    @required this.rotateAnimation,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final double degressfrom;
  final Animation rotateAnimation;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        child: Transform.rotate(
          angle: degressfrom * rotateAnimation.value,
          child:
              Icon(Icons.add, color: Color.fromRGBO(32, 34, 44, 1), size: 35),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 20.0,
        onPressed: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}

class _OverlayButton extends StatelessWidget {
  const _OverlayButton({
    Key key,
    @required this.overlayScale,
  }) : super(key: key);

  final Animation overlayScale;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: overlayScale.value,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.white.withOpacity(0.5)),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    Key key,
    @required this.rotationScaleTop,
    @required this.transformAnimation,
  }) : super(key: key);

  final Animation rotationScaleTop;
  final Animation transformAnimation;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: rotationScaleTop.value,
      child: Transform.translate(
        offset: Offset(0, transformAnimation.value),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.photo_camera,
                color: Color.fromRGBO(32, 34, 44, 1),
                size: 30,
              ),
              Icon(
                Icons.videocam,
                color: Color.fromRGBO(32, 34, 44, 1),
                size: 30,
              ),
              Icon(
                Icons.folder_open,
                color: Color.fromRGBO(32, 34, 44, 1),
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

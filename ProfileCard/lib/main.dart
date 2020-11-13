import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Profile Card',
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Tween<double> transformTwenn,
      animatedTweenWidth,
      animatedTweenHeight,
      leftWidthTween,
      heightTween,
      secondTween,
      firstTween;
  Animation transformAnimation,
      scaleAnimation,
      animatedWidth,
      animatedHeight,
      leftWidthAnimation,
      heightAnimation,
      secondAnimation,
      firstAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    firstTween = Tween(begin: 40, end: 120);
    firstAnimation = firstTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.100,
          0.300,
        )));
    secondTween = Tween(begin: 40, end: 30);
    secondAnimation = secondTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.100,
          0.300,
        )));
    leftWidthTween = Tween(begin: 40, end: 300);
    leftWidthAnimation = leftWidthTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.200,
        )));
    heightTween = Tween(begin: 40, end: 385);
    heightAnimation = heightTween.animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.125,
          0.200,
        )));

    scaleAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 1), weight: 80),
    ]).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Created by Yoqedo

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(229, 29, 81, 1),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  _ProfileCard(
                      firstAnimation: firstAnimation,
                      secondAnimation: secondAnimation,
                      scaleAnimation: scaleAnimation,
                      leftWidthAnimation: leftWidthAnimation,
                      heightAnimation: heightAnimation),
                  _MenuPanel(controller: _controller),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//ProfilCard in all the Widget Inside
class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    Key key,
    @required this.firstAnimation,
    @required this.secondAnimation,
    @required this.scaleAnimation,
    @required this.leftWidthAnimation,
    @required this.heightAnimation,
  }) : super(key: key);

  final Animation firstAnimation;
  final Animation secondAnimation;
  final Animation scaleAnimation;
  final Animation leftWidthAnimation;
  final Animation heightAnimation;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: firstAnimation.value,
      right: secondAnimation.value,
      child: Transform.scale(
        alignment: Alignment.topRight,
        scale: scaleAnimation.value,
        child: Container(
          width: leftWidthAnimation.value,
          height: heightAnimation.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black38.withOpacity(0.3),
                spreadRadius: 0.5,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Container(
              //color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 47,
                        backgroundColor: Color.fromRGBO(237, 126, 180, 0.5),
                        child: CircleAvatar(
                          radius: 45.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: AssetImage('images/pic.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'John Donny',
                              style: TextStyle(
                                color: Color.fromRGBO(82, 76, 79, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'donny@yoqedo.com',
                              style: TextStyle(
                                color: Color.fromRGBO(158, 156, 157, 1),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: Color.fromRGBO(234, 232, 233, 1),
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.person,
                            color: Color.fromRGBO(224, 11, 122, 1)),
                        SizedBox(width: 10),
                        Text(
                          'My Account',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.group,
                            color: Color.fromRGBO(232, 63, 125, 1)),
                        SizedBox(width: 10),
                        Text(
                          'Find Friends',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromRGBO(231, 35, 71, 1),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(Icons.camera_roll,
                            color: Color.fromRGBO(240, 101, 110, 1)),
                        SizedBox(width: 10),
                        Text(
                          'Support',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(234, 232, 233, 1),
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: Color.fromRGBO(244, 139, 138, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}

//Navigation Menu on the Top
class _MenuPanel extends StatelessWidget {
  const _MenuPanel({
    Key key,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 30,
      child: Row(
        children: [
          Icon(Icons.chat, size: 25, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.notifications, size: 30, color: Colors.white),
          SizedBox(width: 20),
          _Avatar(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

//CircleAvatar NavigationPanel
class _Avatar extends StatelessWidget {
  const _Avatar({
    Key key,
    @required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black38.withOpacity(0.3),
                  spreadRadius: 0.5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('images/pic.jpg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

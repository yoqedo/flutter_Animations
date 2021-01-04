import 'package:SignUpButton/animated_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AnimatedButto(
            animationDuration: Duration(milliseconds: 1000),
            initFirstText: 'Sign Up',
            initSecondText: 'Success',
            iconData: Icons.check,
            iconSize: 32,
            buttonStyle: ButtonStyle(
              primaryColor: Color.fromRGBO(0, 159, 183, 1.0),
              secondaryColor: Colors.white,
              elevation: 20,
              firstTextStyle: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              secondTextStyle: TextStyle(
                fontSize: 24,
                color: Color.fromRGBO(0, 159, 183, 1.0),
              ),
              borderRadius: 10,
            ),
          ),
        ),
      ),
    );
  }
}

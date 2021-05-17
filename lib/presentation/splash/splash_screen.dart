import 'package:flutter/material.dart';
import 'package:kothon_app/presentation/home/home.dart';
import 'package:transition/transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.green,
          child: Text('Button'),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));

            Navigator.push(
                context,
                Transition(
                    child: HomeScreen(
                      data: "Hunky Punky",
                    ),
                    transitionEffect: TransitionEffect.FADE));
          },
        ),
      ),
    );
  }
}

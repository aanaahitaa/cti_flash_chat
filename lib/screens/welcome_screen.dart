import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_starting_project/screens/login_screen.dart';
import 'package:flash_chat_starting_project/screens/registration_screen.dart';

import '../components/rounded_button.dart';
import '/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      //upperBound: 100,
    );

    //animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.yellow.shade800, end: kBackgroundColor)
        .animate(controller);

    controller.forward();
    //controller.reverse(from: 1);

    // animation.addStatusListener((status) {
    //   //print(status);
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      //print(animation.value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber.withOpacity(controller.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    //height: animation.value * 50,
                    height: 60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 2,
                    animatedTexts: [
                      TypewriterAnimatedText('Flash Chat'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: kLoginButtonColor,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
                color: kRegisterButtonColor,
                title: 'Registration',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}



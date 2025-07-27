import 'package:flutter/material.dart';

import 'main.dart';
import 'welcome.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(microseconds: 2000000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ourOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 500,
                width: 500,
                color: Color.fromARGB(255, 234, 84, 54),
                child: const Image(
                  image: AssetImage('images/final_logo.jpg'),
                )),
            Container(
                child: const Text(
              'Harmonic Hub',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            )),
          ],
        ),
      ),
    );
  }
}

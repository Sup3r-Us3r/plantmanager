import 'package:flutter/material.dart';
import 'package:plantmanager/core/app_gradients.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/welcome'),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
          image: DecorationImage(
            image: AssetImage('assets/images/logotype.png'),
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}

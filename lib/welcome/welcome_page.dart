import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  void _handleNavigateToConfirmNamePage(BuildContext context) {
    Navigator.pushNamed(context, '/confirmName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Gerencie\nsuas plantas de\nforma fácil',
              style: AppTextStyles.heading32,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            Image.asset('assets/images/watering.png', fit: BoxFit.cover),
            SizedBox(height: 30.0),
            Text(
              'Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar você sempre que precisar.',
              style: AppTextStyles.bodyDark,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () => _handleNavigateToConfirmNamePage(context),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(16.0),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  AppColors.green,
                ),
              ),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
    );
  }
}

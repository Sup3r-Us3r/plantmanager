import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/widgets/button/button_widget.dart';

class SuccessPage extends StatelessWidget {
  String emojiPath;
  String title;
  String description;
  String buttonLabel;
  String routeRedirect;

  SuccessPage({
    Key? key,
    required this.emojiPath,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.routeRedirect,
  }) : super(key: key);

  void _handleNavigateToWhichPage(BuildContext context) {
    Navigator.pushNamed(context, routeRedirect);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26.0),
        margin: EdgeInsets.only(top: 90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(emojiPath, fit: BoxFit.contain),
            SizedBox(height: 50.0),
            Text(title, style: AppTextStyles.heading24),
            SizedBox(height: 30.0),
            Text(
              description,
              style: AppTextStyles.bodyDark,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            ButtonWidget(
              buttonLabel: buttonLabel,
              onPressed: () => _handleNavigateToWhichPage(context),
            )
          ],
        ),
      ),
    );
  }
}

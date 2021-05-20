import 'package:flutter/material.dart';
import 'package:plantmanager/confirm_name/confirm_name_controller.dart';
import 'package:plantmanager/core/app_colors.dart';
import 'package:plantmanager/core/app_text_styles.dart';
import 'package:plantmanager/shared/models/success_model.dart';
import 'package:plantmanager/shared/widgets/button/button_widget.dart';
import 'package:provider/provider.dart';

class ConfirmNamePage extends StatelessWidget {
  ConfirmNamePage({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  void _handleNavigateToSuccessPage(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/success',
      arguments: SuccessModel(
        emojiPath: 'assets/images/emoji3.png',
        title: 'Prontinho',
        description:
            'Agora vamos começar a cuidar das suas plantinhas com muito cuidado.',
        buttonLabel: 'Começar',
        routeRedirect: '/choosePlant',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ConfirmNameController _controller =
        Provider.of<ConfirmNameController>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(26.0),
        margin: EdgeInsets.only(top: 90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/emoji1.png', fit: BoxFit.cover),
            SizedBox(height: 30.0),
            Text(
              'Como podemos\nchamar você?',
              style: AppTextStyles.heading24,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _textController,
              onChanged: (_) {
                _controller.handleSetIsValidTrue();
              },
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              cursorColor: AppColors.green,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.green,
                  ),
                ),
                hintText: 'Digite um nome',
                hintStyle: AppTextStyles.bodyDark,
              ),
              style: AppTextStyles.bodyDark,
            ),
            SizedBox(height: 30.0),
            ButtonWidget(
              buttonLabel: 'Confimar',
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _controller.handleSetMyName(_textController.text);
                  _handleNavigateToSuccessPage(context);
                } else {
                  _controller.handleSetIsValidFalse();
                }
              },
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}

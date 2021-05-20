import 'package:flutter/material.dart';
import 'package:plantmanager/confirm_name/confirm_name_controller.dart';
import 'package:plantmanager/core/core.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  String buttonLabel;
  final VoidCallback onPressed;

  ButtonWidget({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConfirmNameController _confirmNameController =
        Provider.of<ConfirmNameController>(context);

    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            _confirmNameController.isValid ? AppColors.green : AppColors.red,
          ),
        ),
        child: Text(
          _confirmNameController.isValid
              ? buttonLabel
              : 'Campo inválido, tente novamente',
          style: AppTextStyles.textButton,
        ),
      ),
    );
  }
}

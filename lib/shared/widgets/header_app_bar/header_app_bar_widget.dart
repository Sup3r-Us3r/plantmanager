import 'package:flutter/material.dart';
import 'package:plantmanager/confirm_name/confirm_name_controller.dart';
import 'package:plantmanager/core/core.dart';
import 'package:provider/provider.dart';

class HeaderAppBarWidget extends StatelessWidget {
  HeaderAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ConfirmNameController _confirmNameController =
        Provider.of<ConfirmNameController>(context);

    return Padding(
      padding: EdgeInsets.only(
        top: 60.0,
        bottom: 40.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: 'Olá,\n',
              style: TextStyle(
                fontFamily: 'Jost-Light',
                fontSize: 32.0,
                color: AppColors.heading,
              ),
              children: [
                TextSpan(
                  text: _confirmNameController.myName,
                  style: TextStyle(
                    fontFamily: 'Jost-Bold',
                    fontWeight: FontWeight.w600,
                    fontSize: 32.0,
                    color: AppColors.heading,
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.network(
                'https://cdn.discordapp.com/avatars/838196980298678333/000cc30438c7d6b24521ed9691edbb77.png',
                fit: BoxFit.cover,
              ),
              // child: Image.asset('assets/images/icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';

class WateringPlantWidget extends StatelessWidget {
  final String title;
  final double marginTop;

  WateringPlantWidget({
    Key? key,
    required this.title,
    this.marginTop = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, marginTop, 0.0),
      margin: EdgeInsets.symmetric(horizontal: 32.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/waterdrop.png',
              height: 56.0,
              width: 56.0,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: AppTextStyles.heading15,
            ),
          ),
        ],
      ),
    );
  }
}

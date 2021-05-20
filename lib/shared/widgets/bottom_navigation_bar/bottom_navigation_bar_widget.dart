import 'package:flutter/material.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_widget_controller.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarWidgetController _controller =
        Provider.of<BottomNavigationBarWidgetController>(context);

    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withOpacity(.3),
            blurRadius: 50.0,
            offset: Offset(0, -5), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _controller.handleButtonSelected(0);
              Navigator.pushNamed(context, '/choosePlant');
            },
            child: Container(
              height: 50.0,
              color: AppColors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: _controller.buttonSelected == 0
                        ? AppColors.green
                        : AppColors.gray,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Nova planta',
                    style: _controller.buttonSelected == 0
                        ? AppTextStyles.bottomNavigatorTextActive
                        : AppTextStyles.bottomNavigatorTextDisable,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _controller.handleButtonSelected(1);
              Navigator.pushNamed(context, '/myPlants');
            },
            child: Container(
              height: 50.0,
              color: AppColors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.format_list_bulleted,
                    color: _controller.buttonSelected == 1
                        ? AppColors.green
                        : AppColors.gray,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'Minhas plantinhas',
                    style: _controller.buttonSelected == 1
                        ? AppTextStyles.bottomNavigatorTextActive
                        : AppTextStyles.bottomNavigatorTextDisable,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

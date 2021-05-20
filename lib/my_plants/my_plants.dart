import 'package:flutter/material.dart';
import 'package:plantmanager/core/app_colors.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/my_plants/my_plants_controller.dart';
import 'package:plantmanager/my_plants/widgets/app_bar/app_bar_widget.dart';
import 'package:plantmanager/my_plants/widgets/watering_plant_item/watering_plant_item_widget.dart';
import 'package:plantmanager/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:plantmanager/shared/widgets/watering_plant/watering_plant_widget.dart';
import 'package:provider/provider.dart';

class MyPlants extends StatelessWidget {
  MyPlants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyPlantsController _controller =
        Provider.of<MyPlantsController>(context);

    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_controller.myPlants.length != 0)
            WateringPlantWidget(title: _controller.handleWateringPlantTime()),
          if (_controller.myPlants.length != 0)
            Padding(
              padding: EdgeInsets.only(
                top: 32.0,
                left: 32.0,
                right: 32.0,
                bottom: 10.0,
              ),
              child: Text('Próximas regadas', style: AppTextStyles.heading24),
            ),
          Expanded(
            child: WateringPlantItemWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
      backgroundColor: AppColors.white,
    );
  }
}

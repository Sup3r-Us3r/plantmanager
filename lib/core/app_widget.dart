import 'package:flutter/material.dart';
import 'package:plantmanager/choose_plant/choose_plant_controller.dart';
import 'package:plantmanager/confirm_name/confirm_name_controller.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/generate_route.dart';
import 'package:plantmanager/my_plants/my_plants_controller.dart';
import 'package:plantmanager/plant_details/plant_details_controller.dart';
import 'package:plantmanager/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_widget_controller.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ConfirmNameController>.value(
          value: ConfirmNameController(),
        ),
        ChangeNotifierProvider<ChoosePlantController>.value(
          value: ChoosePlantController(),
        ),
        ChangeNotifierProvider<BottomNavigationBarWidgetController>.value(
          value: BottomNavigationBarWidgetController(),
        ),
        ChangeNotifierProvider<PlantDetailsController>.value(
          value: PlantDetailsController(),
        ),
        ChangeNotifierProvider<MyPlantsController>.value(
          value: MyPlantsController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant Manager',
        theme: ThemeData(
          accentColor: AppColors.green,
        ),
        initialRoute: '/splash',
        onGenerateRoute: GenerateRoute.generateRoute,
      ),
    );
  }
}

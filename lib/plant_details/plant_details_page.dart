import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantmanager/core/app_colors.dart';
import 'package:plantmanager/core/app_text_styles.dart';
import 'package:plantmanager/my_plants/my_plants_controller.dart';
import 'package:plantmanager/plant_details/plant_details_controller.dart';
import 'package:plantmanager/shared/models/plants_model.dart';
import 'package:plantmanager/shared/models/success_model.dart';
import 'package:plantmanager/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_widget_controller.dart';
import 'package:plantmanager/shared/widgets/button/button_widget.dart';
import 'package:plantmanager/shared/widgets/watering_plant/watering_plant_widget.dart';
import 'package:provider/provider.dart';

class PlantDetailsPage extends StatelessWidget {
  final PlantsModel plant;

  PlantDetailsPage({
    Key? key,
    required this.plant,
  }) : super(key: key);

  void _handleNavigateToSuccessPage(BuildContext context) {
    final BottomNavigationBarWidgetController _bottomNavigationController =
        Provider.of<BottomNavigationBarWidgetController>(
      context,
      listen: false,
    );

    _bottomNavigationController.handleButtonSelected(1);

    Navigator.pushNamed(
      context,
      '/success',
      arguments: SuccessModel(
        emojiPath: 'assets/images/emoji4.png',
        title: 'Tudo certo',
        description:
            'Fique tranquilo que sempre vamos lembrar você de cuidar da sua plantinha com bastante amor.',
        buttonLabel: 'Muito obrigado :D',
        routeRedirect: '/myPlants',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PlantDetailsController _controller =
        Provider.of<PlantDetailsController>(context);

    final MyPlantsController _myPlantsController =
        Provider.of<MyPlantsController>(context);

    final BottomNavigationBarWidgetController _bottomNavigationController =
        Provider.of<BottomNavigationBarWidgetController>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.shape,
        iconTheme: IconThemeData(color: AppColors.bodyDark),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(32.0),
                  height: 390.0,
                  decoration: BoxDecoration(
                    color: AppColors.shape,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        plant.photo,
                        height: 200.0,
                      ),
                      Text(
                        plant.name,
                        style: AppTextStyles.heading24,
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        plant.about,
                        style: AppTextStyles.bodyDark,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                WateringPlantWidget(
                  title: plant.waterTips,
                  marginTop: -45.0,
                ),
                Text(
                  'Escolha o melhor horário para ser lembrado:',
                  style: AppTextStyles.bodyDark,
                ),
                SizedBox(height: 20.0),
                TextButton(
                  onPressed: () => _controller.selectTime(context),
                  child: Container(
                    height: 32.0,
                    width: 260.0,
                    decoration: BoxDecoration(
                      color: AppColors.shape,
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.shape.withOpacity(.5),
                          AppColors.blueLight.withOpacity(.5),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shape,
                          blurRadius: 10.0,
                          offset: Offset(-5.0, 10.0),
                        ),
                        BoxShadow(
                          color: AppColors.background,
                          blurRadius: 10.0,
                          offset: Offset(10.0, -10.0),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${_controller.selectTimeData.hour} horas',
                          style: AppTextStyles.bodyDark,
                        ),
                        Text(
                          '${_controller.selectTimeData.minute} min',
                          style: AppTextStyles.bodyDark,
                        ),
                        Text(
                          '0 seg',
                          style: AppTextStyles.bodyDark,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: ButtonWidget(
                buttonLabel: _myPlantsController.checkPlantAlreadyExists(plant)
                    ? 'Planta já cadastrada'
                    : 'Cadastrar planta',
                onPressed: () {
                  _controller.scheduleNotification(_controller.selectTimeData);

                  if (!_myPlantsController.checkPlantAlreadyExists(plant)) {
                    _myPlantsController.handleAddNewPlant(
                      plant,
                      _controller.selectTimeData,
                    );

                    return _handleNavigateToSuccessPage(context);
                  }

                  if (_myPlantsController.checkPlantAlreadyExists(plant)) {
                    _bottomNavigationController.handleButtonSelected(1);
                    Navigator.pushNamed(context, '/myPlants');
                  }
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantmanager/core/core.dart';
import 'package:plantmanager/shared/models/my_plants_model.dart';
import 'package:plantmanager/shared/models/plants_model.dart';

class MyPlantsController extends ChangeNotifier {
  List<MyPlantsModel> myPlants = [];
  bool confirmPlantCancel = false;

  void handleCancelPlantExclusion() {
    confirmPlantCancel = true;
    notifyListeners();
  }

  Future handleShowModal(BuildContext context, PlantsModel plant) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                height: 322.0,
                width: 265.0,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 120.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          gradient: AppGradients.backgroundEnviroments,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SvgPicture.network(
                          plant.photo,
                          height: 80.0,
                          width: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Deseja mesmo deletar sua',
                        style: AppTextStyles.bodyDark,
                      ),
                      Text(
                        'Zamioculca?',
                        style: AppTextStyles.bodyDark,
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        children: [
                          Container(
                            height: 48.0,
                            width: 96.0,
                            decoration: BoxDecoration(
                              gradient: AppGradients.backgroundEnviroments,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                overlayColor: MaterialStateProperty.all<Color>(
                                  AppColors.shape,
                                ),
                              ),
                              onPressed: () {
                                handleCancelPlantExclusion();
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'Cancelar',
                                style: AppTextStyles.heading,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            height: 48.0,
                            width: 96.0,
                            decoration: BoxDecoration(
                              gradient: AppGradients.backgroundEnviroments,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                overlayColor: MaterialStateProperty.all<Color>(
                                  AppColors.red.withAlpha(10),
                                ),
                              ),
                              onPressed: () {
                                handleRemovePlant(plant.id);
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'Deletar',
                                style: AppTextStyles.headingDanger,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: AppColors.black.withOpacity(0.0),
        );
      },
    );
  }

  bool checkPlantAlreadyExists(PlantsModel plant) {
    try {
      myPlants.firstWhere(
        (element) => element.plant.id == plant.id,
        orElse: null,
      );

      return true;
    } on StateError catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  void handleAddNewPlant(PlantsModel plant, TimeOfDay remember) {
    if (!checkPlantAlreadyExists(plant)) {
      myPlants.add(
        MyPlantsModel(
          plant: plant,
          remember: remember,
        ),
      );
    }
  }

  void handleRemovePlant(int plantId) {
    myPlants.removeWhere((element) => element.plant.id == plantId);

    notifyListeners();
  }

  String handleWateringPlantTime() {
    myPlants.sort(
      (a, b) => DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        a.remember.hour,
        a.remember.minute,
      ).compareTo(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          b.remember.hour,
          b.remember.minute,
        ),
      ),
    );

    var hourNow = DateTime.now().hour;
    var hourDifference = myPlants[0].remember.hour - hourNow;
    var minuteNow = DateTime.now().minute;
    var minuteDifference = myPlants[0].remember.minute - minuteNow;

    return 'Regue sua ${myPlants[0].plant.name} daqui a ${hourDifference != 0 ? '$hourDifference horas' : '$minuteDifference minutos'}';
  }
}

import 'package:flutter/foundation.dart';
import 'package:plantmanager/choose_plant/choose_plant_repository.dart';
import 'package:plantmanager/choose_plant/choose_plant_state.dart';
import 'package:plantmanager/shared/models/plants_enviroments_model.dart';
import 'package:plantmanager/shared/models/plants_model.dart';

class ChoosePlantController extends ChangeNotifier {
  ChoosePlantState statePlants = ChoosePlantState.empty;
  ChoosePlantState statePlantsEnvironments = ChoosePlantState.empty;
  List<PlantsEnviromentsModel> plantsEnvironments = [];
  List<PlantsModel> plants = [];
  List<PlantsModel> plantsFiltered = [];
  int buttonSelected = 0;
  String plantEnvironmentSelected = 'all';

  final choosePlantRepository = ChoosePlantRepository();

  void getPlantsEnviroments() async {
    statePlantsEnvironments = ChoosePlantState.loading;

    var response = await choosePlantRepository.getPlantsEnviroments();
    plantsEnvironments = response;

    statePlantsEnvironments = ChoosePlantState.success;

    notifyListeners();
  }

  void handleRenderPlantsByEnvironment() {
    var plantsByEnvironment = plants
        .where((plant) => plant.environments.contains(plantEnvironmentSelected))
        .toList();

    plantsFiltered = plantsByEnvironment;

    notifyListeners();
  }

  void getPlants() async {
    statePlants = ChoosePlantState.loading;

    var response = await choosePlantRepository.getPlants();
    plants = response;
    plantsFiltered = response;

    statePlants = ChoosePlantState.success;

    notifyListeners();
  }

  void handleButtonSelected(int indexOfButton, String plantEnvironment) {
    buttonSelected = indexOfButton;
    plantEnvironmentSelected = plantEnvironment;

    handleRenderPlantsByEnvironment();
  }
}

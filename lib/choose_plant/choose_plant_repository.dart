import 'package:dio/dio.dart';
import 'package:plantmanager/shared/models/plants_enviroments_model.dart';
import 'package:plantmanager/shared/models/plants_model.dart';

class ChoosePlantRepository {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://0.0.0.0:3000',
    ),
  );
  late Response response;

  Future<List<PlantsEnviromentsModel>> getPlantsEnviroments() async {
    response = await dio.get('/plants_environments');

    var plantsEnvironmentsData = (response.data as List)
        .map((item) => PlantsEnviromentsModel.fromJson(item))
        .toList();

    return plantsEnvironmentsData;
  }

  Future<List<PlantsModel>> getPlants() async {
    response = await dio.get('/plants');

    var plantsData = (response.data as List)
        .map(
          (item) => PlantsModel.fromJson(item),
        )
        .toList();

    return plantsData;
  }
}

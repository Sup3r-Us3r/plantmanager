import 'package:flutter/material.dart';
import 'package:plantmanager/shared/models/plants_model.dart';

class MyPlantsModel {
  final PlantsModel plant;
  final TimeOfDay remember;

  MyPlantsModel({required this.plant, required this.remember});
}

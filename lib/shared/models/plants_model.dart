class PlantsModel {
  final int id;
  final String name;
  final String about;
  final String waterTips;
  final String photo;
  final List<String> environments;
  final FrequencyModel frequency;

  PlantsModel({
    required this.id,
    required this.name,
    required this.about,
    required this.waterTips,
    required this.photo,
    required this.environments,
    required this.frequency,
  });

  factory PlantsModel.fromJson(Map<String, dynamic> json) {
    return PlantsModel(
      id: json['id'],
      name: json['name'],
      about: json['about'],
      waterTips: json['water_tips'],
      photo: json['photo'],
      environments: json['environments'].cast<String>(),
      frequency: FrequencyModel.fromJson(json['frequency']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'about': this.about,
      'waterTips': this.waterTips,
      'photo': this.photo,
      'environments': this.environments,
      'frequency': this.frequency.toJson(),
    };
  }
}

class FrequencyModel {
  final int times;
  final String repeatEvery;

  FrequencyModel({
    required this.times,
    required this.repeatEvery,
  });

  factory FrequencyModel.fromJson(Map<String, dynamic> json) {
    return FrequencyModel(
      times: json['times'],
      repeatEvery: json['repeat_every'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'times': this.times,
      'repeatEvery': this.repeatEvery,
    };
  }
}

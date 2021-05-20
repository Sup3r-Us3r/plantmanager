class PlantsEnviromentsModel {
  final String key;
  final String title;

  PlantsEnviromentsModel({
    required this.key,
    required this.title,
  });

  factory PlantsEnviromentsModel.fromJson(Map<String, dynamic> json) {
    return PlantsEnviromentsModel(
      key: json['key'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': this.key,
      'title': this.title,
    };
  }
}

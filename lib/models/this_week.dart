import 'dart:convert';

class WeekResult {
  WeekResult({
    required this.date,
    required this.outcomes,
  });

  String date;
  List<Outcome> outcomes;

  factory WeekResult.fromJson(Map<String, dynamic> json) {
    return new WeekResult(
        date: json['date'],
        outcomes: List<Outcome>.from(
            json['outcomes'].map((x) => Outcome.fromJson(x))));
  }

  // factory WeekResult.fromJson(Map<String, dynamic> json) => WeekResult(
  //       date: json["date"],
  //       outcomes: List<Outcome>.from(
  //           json["outcomes"].map((x) => Outcome.fromJson(x))),
  //     );

  Map<String, dynamic> toJson() => {
        "date": date,
        "outcomes": List<dynamic>.from(outcomes.map((x) => x.toJson())),
      };
}

class Outcome {
  Outcome({
    required this.category,
    required this.time,
    required this.description,
    required this.nominal,
    required this.color,
    required this.icon,
  });

  String category;
  String time;
  String description;
  String nominal;
  String color;
  String icon;

  factory Outcome.fromJson(Map<String, dynamic> json) => Outcome(
        category: json["category"],
        time: json["time"],
        description: json["description"],
        nominal: json["nominal"],
        color: json["color"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "time": time,
        "description": description,
        "nominal": nominal,
        "color": color,
        "icon": icon,
      };
}

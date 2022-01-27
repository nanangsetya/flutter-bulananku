class MonthResult {
  String category;
  String nominal;
  String icon;
  String color;

  MonthResult(
      {required this.category,
      required this.nominal,
      required this.icon,
      required this.color});

  factory MonthResult.fromJson(Map<String, dynamic> json) {
    return new MonthResult(
        category: json['category'].toString(),
        nominal: json['outcome'].toString(),
        color: json['color'].toString(),
        icon: json['icon'].toString());
  }
}

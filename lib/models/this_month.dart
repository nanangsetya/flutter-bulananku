class MonthResult {
  String category;
  String nominal;

  MonthResult({required this.category, required this.nominal});

  factory MonthResult.fromJson(Map<String, dynamic> json) {
    return new MonthResult(
        category: json['category'].toString(),
        nominal: json['outcome'].toString());
  }
}

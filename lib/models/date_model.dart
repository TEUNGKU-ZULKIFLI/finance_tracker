class DateModel {
  final int? id;
  final String date;

  DateModel({this.id, required this.date});

  factory DateModel.fromMap(Map<String, dynamic> map) => DateModel(
    id: map['id'],
    date: map['date'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date,
  };
}

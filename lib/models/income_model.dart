class IncomeModel {
  final int? id;
  final int dateId;
  final int gaji;
  final int lainnya;

  IncomeModel({
    this.id,
    required this.dateId,
    required this.gaji,
    required this.lainnya,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> map) => IncomeModel(
    id: map['id'],
    dateId: map['date_id'],
    gaji: map['gaji'],
    lainnya: map['lainnya'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date_id': dateId,
    'gaji': gaji,
    'lainnya': lainnya,
  };
}
class ExpenseModel {
  final int? id;
  final int dateId;
  final int pagi;
  final int siang;
  final int sore;
  final int malam;
  final int bensin;

  ExpenseModel({
    this.id,
    required this.dateId,
    required this.pagi,
    required this.siang,
    required this.sore,
    required this.malam,
    required this.bensin,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) => ExpenseModel(
    id: map['id'],
    dateId: map['date_id'],
    pagi: map['pagi'],
    siang: map['siang'],
    sore: map['sore'],
    malam: map['malam'],
    bensin: map['bensin'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date_id': dateId,
    'pagi': pagi,
    'siang': siang,
    'sore': sore,
    'malam': malam,
    'bensin': bensin,
  };
}

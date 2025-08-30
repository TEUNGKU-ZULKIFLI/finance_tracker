class SaldoModel {
  final int? id;
  final int dateId;
  final int saldo;

  SaldoModel({this.id, required this.dateId, required this.saldo});

  factory SaldoModel.fromMap(Map<String, dynamic> map) => SaldoModel(
    id: map['id'],
    dateId: map['date_id'],
    saldo: map['saldo'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date_id': dateId,
    'saldo': saldo,
  };
}

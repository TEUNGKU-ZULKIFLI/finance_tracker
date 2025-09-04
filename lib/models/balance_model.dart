class BalanceModel {
  final int? id;
  final int dateId;
  final int balance;

  BalanceModel({this.id, required this.dateId, required this.balance});

  factory BalanceModel.fromMap(Map<String, dynamic> map) => BalanceModel(
    id: map['id'],
    dateId: map['date_id'],
    balance: map['balance'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date_id': dateId,
    'balance': balance,
  };
}

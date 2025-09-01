class EquityModel {
  final int? id;
  final int dateId;
  final int expenseEstimation;
  final int incomeEstimation;
  final int estimationSaldo;

  EquityModel({
    this.id,
    required this.dateId,
    required this.expenseEstimation,
    required this.incomeEstimation,
    required this.estimationSaldo,
  });

  factory EquityModel.fromMap(Map<String, dynamic> map) => EquityModel(
    id: map['id'],
    dateId: map['date_id'],
    expenseEstimation: map['expense_estimation'],
    incomeEstimation: map['income_estimation'],
    estimationSaldo: map['estimation_saldo'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'date_id': dateId,
    'expense_estimation': expenseEstimation,
    'income_estimation': incomeEstimation,
    'estimation_saldo': estimationSaldo,
  };
}

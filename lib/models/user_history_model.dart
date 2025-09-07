class UserHistoryModel {
  final int? id;
  final String action;
  final String desc;
  final String timestamp;

  UserHistoryModel({
    this.id,
    required this.action,
    required this.desc,
    required this.timestamp,
  });

  factory UserHistoryModel.fromMap(Map<String, dynamic> map) => UserHistoryModel(
    id: map['id'],
    action: map['action'],
    desc: map['desc'],
    timestamp: map['timestamp'],
  );
}